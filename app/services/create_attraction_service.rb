class CreateAttractionService
  def initialize(params)
    @params = params
    @schedule_day = ScheduleDay.find(params[:schedule_day_id])
  end

  def execute
    attraction = @schedule_day.attractions.new(attraction_params)
    attraction.index = @schedule_day.attractions.count + 1
    if attraction.save
      calculate_distance(attraction)
      attraction.decorate
    end
  end

  private
  def calculate_distance(attraction)
    last_attraction = @schedule_day.attractions.find_by(index: attraction.index - 1)
    CalculateDistanceService.new.calculate_distance(last_attraction, attraction) if last_attraction
  end

  def attraction_params
    @params.require(:attraction).permit(:place_id, :hour_spend)
  end
end