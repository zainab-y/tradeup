class CreateJobCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :job_categories do |t|
      t.string :category

      t.timestamps
    end
  end
end
