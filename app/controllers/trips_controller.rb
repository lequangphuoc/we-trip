class TripsController < ApplicationController
  before_action :require_login

  def create
  end

  def new
    @region_names = Region.all.map { |region| region.name }
  end
end
