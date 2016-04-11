class RegionsController < ApplicationController
  def all
    render json: Region.all
  end
end
