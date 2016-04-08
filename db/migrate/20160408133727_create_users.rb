class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :description
      t.integer :point, default: 0
      t.string :avatar

      t.timestamps null: false
    end
  end
end
