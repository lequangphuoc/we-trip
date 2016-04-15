class DestroyAttractionService
  def initialize(params)
    @attraction = Attraction.find(params[:id])
    @schedule_day = ScheduleDay.find(params[:schedule_day_id])
  end

  def execute
    update_attractions_index
    destroy_attraction
    calculate_distance
  end

  private
  def update_attractions_index
    @schedule_day.attractions.each do |attraction|
      attraction.decrement!(:index, by = 1) if attraction.index > @attraction.index
    end
  end

  def calculate_distance
    CalculateDistanceService.new(@schedule_day.id).execute
  end

  def destroy_attraction
    @attraction.destroy
  end
end