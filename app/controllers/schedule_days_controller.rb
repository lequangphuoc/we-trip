class ScheduleDaysController < ApplicationController
  before_action :require_login
  before_action :get_trip

  def create
    @schedule_day = @trip.schedule_days.create(
        index: next_index, title: "Day #{next_index}"
    )
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def next_index
    @trip.schedule_days.count + 1
  end
end
