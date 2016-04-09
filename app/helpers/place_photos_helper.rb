module PlacePhotosHelper
  def render_place_photos(place_photos)
    place_photos.blank? ? empty_view : place_photos_view(place_photos)
  end

  private
  def place_photos_view(place_photos)
    render place_photos
  end

  def empty_view
    '<p>There is no image for this location yet.</p>'.html_safe
  end
end