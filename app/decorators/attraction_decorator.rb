class AttractionDecorator < Draper::Decorator
  delegate_all

  def image_url
    object.place.place_photos.count > 0 ? first_image_url : '/assets/hcm_church.jpg'
  end

  def title
    object.place.name
  end

  private
  def first_image_url
    place_photo = object.place.place_photos.first
    GoogleApiClient.get_place_photo(place_photo.photo_reference, place_photo.height)
  end
end
