class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :uid, index: true
      t.string :access_token
      t.string :name, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
