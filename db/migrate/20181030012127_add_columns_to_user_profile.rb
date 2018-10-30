class AddColumnsToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_profiles, :user, foreign_key: true
    add_column :user_profiles, :street, :string
    add_column :user_profiles, :suburb, :string
    add_column :user_profiles, :postcode, :string
  end
end
