class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.datetime :tenant_available_time

      t.timestamps
    end
  end
end
