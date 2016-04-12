class UserTripsController < ApplicationController
  before_action :require_login
  before_action :get_user_trips

  def create
    @user_trip = @user_trips.new(trip_id: params[:trip_id])
    render json: JsonResponse.new(@user_trip.save, @user_trip)
  end

  def destroy
    @user_trip = @user_trips.find_by(trip_id: params[:trip_id]).destroy
    render json: JsonResponse.new(true, @user_trip)
  end

  private
  def get_user_trips
    @user_trips = User.find_by(name: params[:tag]).user_trips
  end
end
