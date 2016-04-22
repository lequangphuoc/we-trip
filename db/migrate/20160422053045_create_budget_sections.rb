class CreateBudgetSections < ActiveRecord::Migration
  def change
    create_table :budget_sections do |t|
      t.references :schedule_day, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
