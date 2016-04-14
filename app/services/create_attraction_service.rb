class CreateAttractionService
  def initialize(params)
    @schedule_day = ScheduleDay.find(params[:schedule_day_id])
    @params = params
  end

  def execute
    attraction = @schedule_day.attractions.new(attraction_params)
    attraction.index = @schedule_day.attractions.count + 1
    attraction.decorate if attraction.save
  end

  private
  def attraction_params
    @params.require(:attraction).permit(:place_id, :hour_spend)
  end
end