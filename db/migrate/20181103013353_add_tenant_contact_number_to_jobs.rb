class AddTenantContactNumberToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :tenant_one_name, :string
    add_column :jobs, :tenant_two_name, :string
    add_column :jobs, :tenant_one_contact, :string
    add_column :jobs, :tenant_two_contact, :string
  end
end
