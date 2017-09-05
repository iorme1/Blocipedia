class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]

  has_many :collaborators
  has_many :wikis
  has_many :wiki_collaborations, through: :collaborators, source: :wiki

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
