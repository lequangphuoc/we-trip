class LocationsController < ApplicationController
	def index
	end

	def show
		init
	end

	private
	def init
		@location = Region.where(id: params[:id]) + Place.where(id: params[:id])
		case @location.first.class.name
		when 'Place'
			@location = Place.find(params[:id])
			@photos = PlacePhoto.where(place: location)
		when 'Region'
			@location = Region.find(params[:id])
		else
			redirect_to root_path
		end
	end
end
