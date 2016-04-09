class PlaceDecorator < Draper::Decorator
  delegate_all

  def map_url
    GoogleApiClient.get_map_frame(object.location_id)
  end
end
