class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable 
  has_one :user_profile
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
end
