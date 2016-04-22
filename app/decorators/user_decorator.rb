class UserDecorator < Draper::Decorator
  delegate_all

  def total_amount_to_pay
    object.user_budgets.reduce(0) { |amount, budget| amount + budget.price }
  end
end
