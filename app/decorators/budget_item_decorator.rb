class BudgetItemDecorator < Draper::Decorator
  delegate_all

  def assignee
    split_equally? ? object.user_budgets.first.user.name : 'Split Equally'
  end

  private
  def split_equally?
    object.user_budgets.count > 0
  end
end
