# == Schema Information
#
# Table name: schedule_days
#
#  id         :integer          not null, primary key
#  index      :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduleDaysController < ApplicationController
  before_action :require_login
  before_action :get_trip, only: [:create, :destroy]
  before_action :get_schedule_day, only: [:sort, :destroy]

  def create
    @schedule_day = @trip.schedule_days.create(index: next_index).decorate
    respond_to :js
  end

  def destroy
    ScheduleDay.transaction do
      @trip.schedule_days.each do |day|
        day.update_attributes(index: @schedule_day.index - 1) if day.index > @schedule_day.index
      end
      @schedule_day.destroy
      @trip.schedule_days.reload
      @count = @trip.schedule_days.count
    end
    respond_to :js
  end

  def sort
    SortAttractionsService.new(params).execute
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:trip_id])
  end

  def get_schedule_day
    @schedule_day = ScheduleDay.find(params[:id]).decorate
  end

  def next_index
    @trip.schedule_days.count + 1
  end
end
