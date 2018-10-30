class RemoveAddressIdFromUserProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_profiles, :address_id
  end
end
