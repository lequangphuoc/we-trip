require 'ffaker'

class FetchPlacesService
  def execute
    fetch_places_foreach_region if Place.count == 0
  end

  private
  def fetch_places_foreach_region
    Region.all.each do |region|
      results = GoogleApiClient.get_nearby_places(region.latitude, region.longitude)['results']
      create_places(results, region.id)
    end
  end

  def create_places(results, region_id)
    Place.transaction do
      results.each do |result|
        place = Place.create(
            name: result['name'],
            latitude: result['geometry']['location']['lat'],
            longitude: result['geometry']['location']['lng'],
            region_id: region_id,
            rating: result['rating'],
            vicinity: result['vicinity'],
            location_id: result['place_id'],
            description: FFaker::Lorem.paragraphs(5),
            default_budget: rand(50000..1000000)
        )
        fetch_photos_for_place(place)
      end
    end
  end

  def fetch_photos_for_place(place)
    place_detail = GoogleApiClient.search_place_detail(place.location_id)['result']
    PlacePhoto.transaction do
      place_detail['photos'].each do |photo|
        place.place_photos.create(
            width: photo['width'],
            height: photo['height'],
            photo_reference: photo['photo_reference'],
        )
      end
    end if place_detail['photos']
  end
end