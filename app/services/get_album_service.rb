class GetAlbumService
  def initialize(current_user)
    @provider = current_user.providers.find_by(name: 'facebook')
  end

  def execute
    # graph = Koala::Facebook::API.new(@provider.access_token)
    begin
      graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
      graph.get_connections('me', 'albums').map { |album|
        {
            id: album['id'],
            name: album['name'],
            count: album['count'],
            created_time: Time.new(album['created_time']).strftime('%d/%m/%Y')
        }
      }
    rescue Exception => e
      []
    end
  end
end