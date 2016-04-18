class PlacePhotoDecorator < Draper::Decorator
  delegate_all

  def place_name
    object.place.name
  end

  def url(height = nil)
    image_height = height ? height : object.height
    GoogleApiClient.get_place_photo(object.photo_reference, image_height)
  end
end
