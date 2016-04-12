class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :users, :name
    add_index :places, :name
    add_index :regions, :name
  end
end
