class UserTripsController < ApplicationController
  def create
    @user_trip = User.find_by(name: params[:tag])
                     .user_trips.create(trip_id: params[:trip_id])
    render json: JsonResponse.new(true, @user_trip)
  end

  def destroy
    @destroyed = User.find_by(name: params[:tag])
                     .user_trips.find_by(trip_id: params[:trip_id]).destroy
    render json: JsonResponse.new(true, @destroyed)
  end

  private
  def user_trip_params
    params.require(:user_trip).permit(:user_id, :trip_id)
  end
end
