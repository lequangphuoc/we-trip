class BudgetItemDecorator < Draper::Decorator
  delegate_all

  def assignee
    return '' if object.user_budgets.length == 0
    split_equally? ? 'Split Equally' : object.user_budgets.first.user.name
  end

  private
  def split_equally?
    object.user_budgets.select(:kind).map(&:kind).include?('split')
  end
end
