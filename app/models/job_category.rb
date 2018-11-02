class JobCategory < ApplicationRecord
    has_many :jobs
    has_many :job_categories
end
