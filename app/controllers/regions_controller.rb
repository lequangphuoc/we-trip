class RegionsController < ApplicationController
  def all
    render json: Region.all
  end

  def get_starting_regions
    render json: Region.get_starting_regions
  end

  def get_destinations_regions
    render json: Region.list_of_regions_by_departure(params[:name])
  end
end
