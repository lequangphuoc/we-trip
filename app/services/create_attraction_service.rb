class CreateAttractionService
  def initialize(params)
    @schedule_day = ScheduleDay.find(params[:schedule_day_id])
    @params = params
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
    if last_attraction
      CalculateDistanceService.new.calculate_distance(last_attraction, attraction)
    end
  end

  def attraction_params
    @params.require(:attraction).permit(:place_id, :hour_spend)
  end
end