class WikiPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

   def initialize(user, scope)
     @user = user
     @scope = scope
   end

   def resolve
      if (user.admin? || user.premium?)
        scope.all
      else
        scope.where(private: false)
      end
    end
  end

end
