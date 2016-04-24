class BudgetItemsController < ApplicationController
  before_action :require_login

  def create
    CreateBudgetService.new(params).execute
    prepare_data
    respond_to :js
  end

  def destroy
    BudgetItem.find(params[:id]).destroy
    prepare_data
    respond_to :js
  end

  def update
    UpdateBudgetService.new(params).execute
    prepare_data
    respond_to :js
  end

  private
  def prepare_data
    @trip = Trip.find(params[:trip_id])
    @budget_sections, @user_with_budgets,
        @people_in_trip, @total_money = BudgetPlanQuery.new(@trip).execute
  end
end
