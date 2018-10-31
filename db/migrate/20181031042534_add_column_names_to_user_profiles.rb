class AddColumnNamesToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :street_number, :string
    add_column :user_profiles, :state, :string
  end
end
