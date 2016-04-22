class BudgetPlanQuery
  def initialize(trip)
    @trip = trip
  end

  def execute
    [budget_sections, user_with_budgets, people_in_trip, total_money]
  end

  private
  def budget_sections
    @trip.budget_sections.preload(
        :schedule_day, :budget_items => {:user_budgets => :user}
    ).decorate
  end

  def people_in_trip
    @trip.users
  end

  def total_money
    @trip.total_money
  end

  def user_with_budgets
    @trip.users.includes(:user_budgets => :budget_item)
        .where(user_budgets: {id: @trip.user_budget_ids}).decorate
  end
end