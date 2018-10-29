class AddAddressToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :address, foreign_key: true
  end
end
