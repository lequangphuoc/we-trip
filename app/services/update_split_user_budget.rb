class UpdateSplitUserBudget
  def initialize(trip_id)
    @trip = Trip.find(trip_id)
  end

  def execute
    update_split_user_budgets if @trip.user_budgets.exists?(kind: 'split')
  end

  private
  def update_split_user_budgets
    UserBudget.transaction do
      get_split_budget_items.each do |budget_item|
        update_user_budgets(budget_item)
      end
    end
  end

  def get_split_budget_items
    BudgetItem.find(
        @trip.user_budgets.where(kind: 'split')
            .select(:budget_item_id)
            .map(&:budget_item_id).uniq
    )
  end

  def update_user_budgets(budget_item)
    split_price = budget_item.price / @trip.users.size
    @trip.user_ids.each do |user_id|
      user_budget = UserBudget.where(user_id: user_id, budget_item_id: budget_item.id).first_or_initialize
      user_budget.update_attributes(price: split_price, kind: 'split') if user_budget.save
    end
  end
end