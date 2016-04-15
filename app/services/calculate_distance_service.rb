class CalculateDistanceService
  def initialize(schedule_day_id = nil)
    if schedule_day_id
      @attractions = ScheduleDay.find(schedule_day_id).attractions.preload(:place)
    end
  end

  def execute
    calculate_attractions_distance if process?
  end

  def calculate_distance(current_attraction, attraction)
    current_place, place = current_attraction.place, attraction.place
    response = GoogleApiClient.calculate_distance(
        current_place.latitude, current_place.longitude, place.latitude, place.longitude
    )
    attraction.update_attributes(
        distance: response['distance']['text'],
        duration: response['duration']['text']
    )
  end

  private
  def calculate_attractions_distance
    current_attraction = @attractions.first
    @attractions.each do |attraction|
      next if attraction == current_attraction
      calculate_distance(current_attraction, attraction)
      current_attraction = attraction
    end
  end

  def process?
    !@attractions.blank? && @attractions.pluck(:index) == (1..@attractions.count).to_a
  end
end