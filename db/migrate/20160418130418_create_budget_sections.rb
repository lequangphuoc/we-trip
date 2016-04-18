class CreateBudgetSections < ActiveRecord::Migration
  def change
    create_table :budget_sections do |t|
      t.string :title
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
