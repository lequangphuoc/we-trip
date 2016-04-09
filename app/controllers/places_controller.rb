class PlacesController < ApplicationController
	def index
	end

	def show
		@place = Place.find(params[:id]).decorate
    @place_photos = @place.place_photos.decorate
	end
end
