class PlacesController < ApplicationController
	def index
	end

	def show
		init
	end

	private
	def init
		@place = Place.find(params[:id]).decorate
		@place_photos = @place.place_photos.decorate
	end
end
