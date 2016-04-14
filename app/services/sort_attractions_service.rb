class SortAttractionsService
  def initialize(params)
    @attractions = ScheduleDay.find(params[:id]).attractions
    @indexes = params[:indexes]
  end

  def execute
    sort_attractions if valid_indexes?
  end

  private
  def sort_attractions
    current_attractions = @indexes.map { |index| @attractions.find_by(index: index) }
    current_attractions.each_with_index do |attraction, order|
      handle_attraction_index(attraction, order + 1)
    end
  end

  def valid_indexes?
    @indexes.map(&:to_i).sort == @attractions.pluck(:index).sort
  end

  def handle_attraction_index(attraction, new_index)
    attraction.update_attributes(index: new_index) if attraction.index != new_index
  end
end