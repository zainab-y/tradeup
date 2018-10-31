class AddColumnNamesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :street_number, :string
    add_column :jobs, :state, :string
  end
end
