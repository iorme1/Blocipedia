class User < ActiveRecord::Base
  after_initialize { self.role = :standard }

  enum role: [:standard, :premium, :admin]
  has_many :wikis
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
