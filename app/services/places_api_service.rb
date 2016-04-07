class PlacesApiService
  def execute
    FetchRegionsService.new.execute
    FetchPlacesService.new.execute
  end
end