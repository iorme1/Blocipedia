class WikiPolicy < ApplicationPolicy
  attr_reader :wiki, :user

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    user.admin? || wiki.user == user || wiki.collaborating_users.include?(user)
  end


  class Scope
    attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

    def resolve
      wikis = []

      if user
        if user.role == 'admin'
          wikis = scope.all
        elsif user.role == 'premium'
          wikis = scope.all.select { |wiki| !wiki.private? ||
            wiki.user_id == user.id ||
            wiki.collaborating_users.include?(user) }
        else  #stadard user
          wikis = scope.all.select { |wiki| !wiki.private? ||
            wiki.collaborating_users.include?(user) }
        end
      else #guest user
        wikis = scope.all.select { |wiki| !wiki.private? }
      end
      wikis.sort_by(&:created_at).reverse
    end
  end
end
