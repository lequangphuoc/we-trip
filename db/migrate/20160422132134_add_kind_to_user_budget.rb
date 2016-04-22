class AddKindToUserBudget < ActiveRecord::Migration
  def change
    add_column :user_budgets, :kind, :string, index: true
  end
end
