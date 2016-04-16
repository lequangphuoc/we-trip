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
  before_action :prepare_data, only: [:edit, :update]

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
    @trip.departure = Region.find_by(name: params[:trip][:departure])
    if @trip.update_attributes(trip_update_params)
      redirect_to edit_trip_path(@trip)
    else
      render :edit
    end
  end

  private
  def get_trip
    @trip = Trip.find(params[:id])
  end

  def prepare_data
    @schedule_days = @trip.schedule_days.preload(:attractions).decorate
    # places = Place.all.preload(:region).decorate
    # @place_names = places.map(&:suggest_title)
    # @place_ids = places.map(&:id)
    @places = Place.all.preload(:region).decorate.map { |place| {id: place.id, name: place.suggest_title, photo_url: place.display_image_url} }
  end

  def trip_params
    params.require(:trip).permit(:title, :expected_budget)
  end

  def trip_update_params
    params.require(:trip).permit(
        :title, :description, :expected_budget, :start_date
    )
  end
end
