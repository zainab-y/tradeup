class AddJobCategoryToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_category, foreign_key: true
  end
end
