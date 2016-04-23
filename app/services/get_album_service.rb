class GetAlbumService
  def execute
    graph = Koala::Facebook::API.new(ENV['ACCESS_TOKEN'])
    graph.get_connections('me', 'albums').map { |album|
      {
          id: album['id'],
          name: album['name'],
          count: album['count'],
          created_time: Time.new(album['created_time']).strftime('%d/%m/%Y')
      }
    }
  end
end