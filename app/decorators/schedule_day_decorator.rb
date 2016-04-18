class ScheduleDayDecorator < Draper::Decorator
  delegate_all
  decorates_association :attractions

  def default_active
    object.index == 1 && 'active'
  end

  def title
    "Day #{object.index}"
  end
end
