class PlacePhotoDecorator < Draper::Decorator
  delegate_all

  def place_name
    object.place.name
  end

  def url
    GoogleApiClient.get_place_photo(object.photo_reference, object.height)
  end
end
