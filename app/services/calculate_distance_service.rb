class CalculateDistanceService
  def initialize(schedule_day_id = nil)
    get_attrations(schedule_day_id) if schedule_day_id
  end

  def execute
    calculate_attractions_distance if process?
  end

  def calculate_distance(current_attraction, attraction)
    current_place, place = current_attraction.place, attraction.place
    response = GoogleApiClient.calculate_distance(
        current_place.latitude,
        current_place.longitude,
        place.latitude,
        place.longitude
    )
    attraction.update_attributes(
        distance: response['distance']['text'],
        duration: response['duration']['text']
    )
  end

  private
  def get_attrations(schedule_day_id)
    @attractions = ScheduleDay.find(schedule_day_id).attractions.preload(:place)
  end

  def calculate_attractions_distance
    current_attraction = @attractions.first
    @attractions.drop(0).each do |attraction|
      calculate_distance(current_attraction, attraction)
      current_attraction = attraction
    end
  end

  def process?
    !@attractions.blank? && @attractions.pluck(:index) == (1..@attractions.count).to_a
  end
end