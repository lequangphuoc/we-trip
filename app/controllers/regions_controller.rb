class RegionsController < ApplicationController
  def all
    render json: Region.all
  end

  def get_starting_regions
    @regions = Region.get_starting_regions
    render json: @regions
  end
end
