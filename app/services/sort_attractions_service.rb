class SortAttractionsService
  def initialize(schedule_day, indexes)
    @schedule_day = schedule_day
    @indexes = indexes
  end

  def execute
    sort_attractions
  end

  private
  def sort_attractions
    @schedule_day.attractions.zip(@indexes).each do |attraction, i|
      handle_attraction_index(attraction, i.to_i)
    end
  end

  def handle_attraction_index(attraction, index)
    attraction.update_attributes(index: index) if attraction.index != index
  end
end