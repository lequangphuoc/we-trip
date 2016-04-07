class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :location_id
      t.decimal :rating
      t.decimal :latitude
      t.decimal :longitude
      t.string :vicinity
      t.text :description
      t.references :region, index: true, foreign_key: true
      t.integer :default_budget

      t.timestamps null: false
    end
  end
end
