class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
      t.string :title
      t.integer :index, index: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
