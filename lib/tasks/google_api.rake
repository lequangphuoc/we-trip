namespace :google_api do
  desc 'Pull data from google api'
  task places: :environment do
    PlacesApiService.new.execute
  end
end
