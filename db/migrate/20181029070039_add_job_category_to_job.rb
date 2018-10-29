class AddJobCategoryToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_categories, foreign_key: true
  end
end
