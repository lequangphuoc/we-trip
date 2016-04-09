class LocationsController < ApplicationController
	def index
	end

	def show
		init
	end

	private
	def init
		@location = Place.find(params[:id])
		@photos = PlacePhoto.where(place: @location)
	end
end
