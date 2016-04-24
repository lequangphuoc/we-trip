class UserTripsController < ApplicationController
  before_action :require_login
  before_action :get_user_trips

  def create
    @user_trip = @user_trips.new(trip_id: params[:trip_id])
    @created = @user_trip.save
    UpdateSplitUserBudget.new(params[:trip_id]).execute if @created
    render json: JsonResponse.new(@created, @user_trip)
  end

  def destroy
    @user_trip = @user_trips.find_by(trip_id: params[:trip_id])
    @has_budget = @user_trip.has_budget?
    unless @has_budget
      @user_trip.destroy
      UpdateSplitUserBudget.new(params[:trip_id]).execute
    end
    render json: JsonResponse.new(true, @has_budget)
  end

  private
  def get_user_trips
    @user_trips = User.find_by(name: params[:tag]).user_trips
  end
end
