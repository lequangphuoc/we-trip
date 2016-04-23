class RegionsController < ApplicationController
  def all
    render json: Region.all
  end

  def get_starting_regions
    @regions = Region.get_starting_regions
    render json: @regions
  end

  def get_destinations_regions
    @regions = Region.list_of_regions_by_departure(params[:name])
    render json: @regions
  end
end
