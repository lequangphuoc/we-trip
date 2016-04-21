class GetAlbumService
  attr_reader :access_token

  def initialize(access_token)
    @access_token = access_token
  end

  def execute
    @graph = Koala::Facebook::API.new(access_token)
    profile = @graph.get_object('me')
    
  end
end