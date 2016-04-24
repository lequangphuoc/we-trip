class UpdateBudgetService < CreateBudgetService
  def initialize(params)
    @params = params
    @budget_item = BudgetItem.find(params[:id])
    @trip = Trip.find(params[:trip_id])
  end

  def execute
    ActiveRecord::Base.transaction do
      update_budget
      destroy_user_budgets
      create_user_budgets
    end
  end

  private
  def update_budget
    raise ActiveRecord::Rollback unless @budget_item.update_attributes(budget_item_params)
  end

  def destroy_user_budgets
    @budget_item.user_budgets.destroy_all
  end

  def budget_item_params
    @params.require(:budget_item).permit(
        :price, :name
    )
  end
end