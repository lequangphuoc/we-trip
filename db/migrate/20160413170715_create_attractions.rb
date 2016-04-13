class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.references :schedule_day, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.integer :index, index: true
      t.decimal :hour_spend, default: 1

      t.timestamps null: false
    end
  end
end
