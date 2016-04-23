class StoreAlbumService
  def initialize(trip, album_id)
    @trip = trip
    @album_id = album_id
  end

  def execute
    @trip.attachments.destroy_all
    save_photos
    @trip.attachments.reset
    @trip.attachments
  end

  private
  def save_photos
    graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
    photos = graph.get_connections(@album_id, 'photos').each do |photo|
      Attachment.transaction do
        @trip.attachments.create(path: photo['images'][0]['source'])
      end
    end
  end
end