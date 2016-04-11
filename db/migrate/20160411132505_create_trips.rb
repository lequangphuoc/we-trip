class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description
      t.decimal :expected_budget

      t.timestamps null: false
    end
  end
end
