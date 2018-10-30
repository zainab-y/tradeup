class AddColumnsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :street, :string
    add_column :jobs, :suburb, :string
    add_column :jobs, :postcode, :string
    add_column :jobs, :price, :integer
  end
end
