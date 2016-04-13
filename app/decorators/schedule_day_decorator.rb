class ScheduleDayDecorator < Draper::Decorator
  delegate_all

  def default_active
    object.index == 1 && 'active'
  end
end
