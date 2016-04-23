class AddPublishToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :is_published, :boolean, default: false
  end
end
