class RemoveAddressIdFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :address_id, :string
  end
end
