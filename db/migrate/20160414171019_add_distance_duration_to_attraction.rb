class AddDistanceDurationToAttraction < ActiveRecord::Migration
  def change
    add_column :attractions, :distance, :string
    add_column :attractions, :duration, :string
  end
end
