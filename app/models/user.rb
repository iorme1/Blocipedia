class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]

  has_many :wikis

  has_many :collaborators
  has_many :wiki_collaborations, through: :collaborators, source: :wiki

end
