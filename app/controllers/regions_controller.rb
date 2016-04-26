class RegionsController < ApplicationController
  before_action :get_featured_trips, only: [:hcm, :hanoi, :danang]

  def all
    render json: Region.all
  end

  def get_starting_regions
    render json: Region.get_starting_regions
  end

  def get_destinations_regions
    render json: Region.list_of_regions_by_departure(params[:name])
  end

  def hcm
  end

  def hanoi
  end

  def danang
  end

  private
  def get_featured_trips
    @trips = Trip.where(departure_id: Region.where(name: params[:region_name]).pluck(:id))
  end
end
