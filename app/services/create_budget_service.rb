class CreateBudgetService
  def initialize(params)
    @params = params
    @trip = Trip.find(params[:trip_id])
  end

  def execute
    ActiveRecord::Base.transaction do
      create_budget
      create_user_budgets
    end
  end

  private
  def create_budget
    @budget_item = BudgetItem.create(budget_item_params)
  end

  def create_user_budgets
    if @params[:assignee] == 'split'
      create_split_user_budget
    else
      create_assign_user_budget
    end
  end

  def create_split_user_budget
    split_price = @budget_item.price / @trip.users.count
    @trip.user_ids.each do |user_id|
      @budget_item.user_budgets.create(
          price: split_price, user_id: user_id, kind: 'split'
      )
    end
  end

  def create_assign_user_budget
    @budget_item.user_budgets.create(
        price: @budget_item.price, user_id: @params[:assignee], kind: 'assign'
    )
  end

  def budget_item_params
    @params.require(:budget_item).permit(
        :budget_section_id, :price, :name
    )
  end
end