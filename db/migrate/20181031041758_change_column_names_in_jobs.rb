class ChangeColumnNamesInJobs < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :street, :street_name
    rename_column :jobs, :suburb, :city
  end
end
