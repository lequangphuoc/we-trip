namespace :google_api do
  desc 'Pull data from google api'
  task places: :environment do
    # FetchRegionsService.new.execute
    FetchPlacesService.new.execute
  end
end
