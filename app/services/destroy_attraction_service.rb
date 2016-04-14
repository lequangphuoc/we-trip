class DestroyAttractionService
  def initialize(params)
    @schedule_day = ScheduleDay.find(params[:schedule_day_id])
    @attraction = Attraction.find(params[:id])
  end

  def execute
    update_schedule_day_index
    destroy_attraction
  end

  private
  def update_schedule_day_index
    @schedule_day.attractions.each do |attraction|
      attraction.update_attributes(index: attraction.index - 1) if attraction.index > @attraction.id
    end
  end

  def destroy_attraction
    @attraction.destroy
  end
end