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
    if valid_indexes?
      @schedule_day.attractions.zip(@indexes).each do |attraction, i|
        handle_attraction_index(attraction, i.to_i)
      end
    end
  end

  def valid_indexes?
    @indexes.map(&:to_i).uniq.sort == @schedule_day.attractions.pluck(:index).sort
  end

  def handle_attraction_index(attraction, index)
    attraction.update_attributes(index: index) if attraction.index != index
  end
end