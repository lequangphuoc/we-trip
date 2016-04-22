class BudgetSectionDecorator < Draper::Decorator
  delegate_all

  def title
    object.title ? title : "Day #{object.schedule_day.index}"
  end
end
