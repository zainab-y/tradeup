class ChangeColumnNamesInUserProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_profiles, :street, :street_name
    rename_column :user_profiles, :suburb, :city
  end
end
