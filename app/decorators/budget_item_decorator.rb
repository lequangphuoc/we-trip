class BudgetItemDecorator < Draper::Decorator
  delegate_all

  def assignee
    split_equally? ? 'Split Equally' : object.user_budgets.first.user.name
  end

  private
  def split_equally?
    object.user_budgets.length > 1
  end
end
