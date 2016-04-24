class ItineraryQuery
  def initialize(trip)
    @trip = trip
  end

  def execute
    [schedule_days, places]
  end

  private
  def schedule_days
    @trip.schedule_days.preload(:attractions => {:place => :display_photo}).decorate
  end

  def places
    Place.all.preload(:region, :display_photo).decorate
  end
end