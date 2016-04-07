class HomeController < ApplicationController
  def index
    PlacesApiService.new.execute
  end
end
