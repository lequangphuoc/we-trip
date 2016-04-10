class CreateFriendRelations < ActiveRecord::Migration
  def change
    create_table :friend_relations do |t|
      t.string :status, default: 'pending'
      t.references :user, index: true, foreign_key: true
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
