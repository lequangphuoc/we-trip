class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.references :budget_section, index: true, foreign_key: true
      t.integer :price
      t.string :name

      t.timestamps null: false
    end
  end
end
