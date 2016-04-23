class AttachmentsController < ApplicationController
  before_action :require_login
  before_action :get_trip

  def create
    @photos = StoreAlbumService.new(
        @trip, params[:album_id], current_user
    ).execute
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:trip_id])
  end
end
