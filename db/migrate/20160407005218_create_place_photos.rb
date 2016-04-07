class CreatePlacePhotos < ActiveRecord::Migration
  def change
    create_table :place_photos do |t|
      t.references :place, index: true, foreign_key: true
      t.string :photo_reference
      t.integer :height
      t.integer :width

      t.timestamps null: false
    end
  end
end
