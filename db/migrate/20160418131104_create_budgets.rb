class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :price, default: 0
      t.references :budget_section, index: true, foreign_key: true
      t.references :attraction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
