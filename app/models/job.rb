class Job < ApplicationRecord
    has_one_attached :image  
    has_many :user_jobs 
    has_many :users, through: :user_jobs, dependent: :destroy
    belongs_to :job_category
end
