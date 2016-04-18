class AttractionDecorator < Draper::Decorator
  delegate_all

  def image_url(height = nil)
    object.place.decorate.display_image_url(height)
  end

  def title
    object.place.name
  end
end
