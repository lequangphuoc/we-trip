class PlaceDecorator < Draper::Decorator
  delegate_all

  def map_url
    GoogleApiClient.get_map_frame(object.location_id)
  end

  def suggest_title
    "#{object.name} - #{object.region.name}"
  end

  def display_image_url
    if object.display_photo
      object.display_photo.decorate.url
    else
      'https://www.mariecuriealumni.eu/sites/default/files/styles/50x50_avatar/public/pictures/picture-default.jpg?itok=uk4ugbrt'
    end
  end
end
