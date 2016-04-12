class UserTripsController < ApplicationController
  def create
    @user_trip = UserTrip.create(user_trip_params)
    respond_to :js
  end

  def destroy
    @destroyed = UserTrip.find_by(user_trip_params).destroy
    respond_to :js
  end

  private
  def user_trip_params
    params.require(:user_trip).permit(:user_id, :trip_id)
  end
end
