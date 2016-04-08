# :nocov:
class FetchRegionsService
  def execute
    fetch_regions if Region.count == 0
  end

  private
  def fetch_regions
    region_names = GoogleApiClient.get_all_regions
    Region.transaction do
      region_names.each do |name|
        location = search_region_location(name)
        Region.create(name: name, latitude: location['lat'], longitude: location['lng'])
      end
    end
  end

  def search_region_location(region)
    response = GoogleApiClient.search_address(region)
    response['results'][0]['geometry']['location']
  end
end
# :nocov: