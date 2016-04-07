class GoogleApiClient
  API_KEY = ENV['GOOGLE_API_KEY']
  TYPES = 'museum|night_club|shopping_small|cafe|movie_theater'
  RADIUS = 20000

  def self.search_address(address)
    params = "?address=#{address}&key=#{API_KEY}"
    get_method('https://maps.googleapis.com/maps/api/geocode/json' + params)
  end

  def self.search_place_detail(place_id)
    params = "?placeid=#{place_id}&key=#{API_KEY}"
    get_method('https://maps.googleapis.com/maps/api/place/details/json' + params)
  end

  def self.get_all_regions
    get_method('http://api.tala.xyz/config/data')['regions'].map { |region| region['name'] }
  end

  def self.get_nearby_places(latitude, longitude)
    params = "?location=#{latitude},#{longitude}&type=#{TYPES}&radius=#{RADIUS}&key=#{API_KEY}"
    get_method('https://maps.googleapis.com/maps/api/place/nearbysearch/json' + params)
  end

  private
  def self.get_method(url)
    HTTParty.get(URI.encode(url)).parsed_response
  end
end