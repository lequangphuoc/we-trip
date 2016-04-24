class BudgetSectionDecorator < Draper::Decorator
  delegate_all
  decorates_association :budget_items

  def title
    object.title ? object.title : "Day #{object.schedule_day.index}"
  end
end
