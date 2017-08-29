class User < ActiveRecord::Base

  has_many :wikis
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
