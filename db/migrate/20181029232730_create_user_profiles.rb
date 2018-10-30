class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.text :bio
      t.string :contact
      t.string :abn
      t.string :insurance
      t.string :name
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
