class AddBusinessNameToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :business_name, :string
  end
end
