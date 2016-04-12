# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  start_date      :datetime
#  departure_id    :integer
#  title           :string
#  description     :text
#  expected_budget :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TripsController < ApplicationController
  before_action :require_login
  before_action :get_trip, only: [:edit, :update, :show]

  def show
  end

  def new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @created = @trip.save
    respond_to :js
  end

  def update
    @updated = @trip.update_attributes(trip_update_params)
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :expected_budget)
  end

  def trip_update_params
    params.require(:trip).permit(
        :title, :description, :expected_budget, :start_date, :departure_id
    )
  end
end
