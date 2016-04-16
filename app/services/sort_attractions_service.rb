class SortAttractionsService
  def initialize(params)
    @attractions = ScheduleDay.find(params[:id]).attractions
    @schedule_day_id = params[:id]
    @indexes = params[:indexes].map(&:to_i)
  end

  def execute
    if valid_indexes?
      sort_attractions
      calculate_distance
    end
  end

  private
  def sort_attractions
    Attraction.transaction do
      current_attractions.each_with_index do |attraction, order|
        handle_attraction_index(attraction, order + 1)
      end
    end
  end

  def current_attractions
    @indexes.map { |index| @attractions.find_by(index: index) }
  end

  def valid_indexes?
    @indexes.sort == @attractions.pluck(:index).sort
  end

  def calculate_distance
    CalculateDistanceService.new(@schedule_day_id).execute
  end

  def handle_attraction_index(attraction, new_index)
    attraction.update_attributes(index: new_index) if attraction.index != new_index
  end
end