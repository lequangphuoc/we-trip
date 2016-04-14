class ScheduleDaysController < ApplicationController
  before_action :require_login
  before_action :get_trip, only: [:create]
  before_action :get_schedule_day, only: [:sort]

  def create
    @schedule_day = @trip.schedule_days.create(
        index: next_index, title: "Day #{next_index}"
    ).decorate
    respond_to :js
  end

  def sort
    SortAttractionsService.new(@schedule_day, params[:indexes]).execute
    @schedule_day.attractions.reload
    @schedule_day = @schedule_day.decorate
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def get_schedule_day
    @schedule_day = ScheduleDay.find(params[:id])
  end

  def next_index
    @trip.schedule_days.count + 1
  end
end
