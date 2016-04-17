class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :description
      t.string :category

      t.timestamps null: false
    end
  end
end
