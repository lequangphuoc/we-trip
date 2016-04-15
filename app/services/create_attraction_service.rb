class CreateAttractionService
  def initialize(params)
    @params = params
  end

  def execute
    get_attractions
    create_attraction
  end

  private
  def get_attractions
    @attractions = ScheduleDay.find(@params[:schedule_day_id]).attractions
  end

  def create_attraction
    attraction = @attractions.new(attraction_params)
    attraction.index = @attractions.count + 1
    if attraction.save
      calculate_distance(attraction)
      attraction.decorate
    end
  end

  def calculate_distance(attraction)
    last_attraction = @attractions.find_by(index: attraction.index - 1)
    CalculateDistanceService.new.calculate_distance(last_attraction, attraction) if last_attraction
  end

  def attraction_params
    @params.require(:attraction).permit(:place_id, :hour_spend)
  end
end