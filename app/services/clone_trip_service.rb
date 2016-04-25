class CloneTripService
  def initialize(trip, current_user)
    @trip = trip
    @current_user = current_user
  end

  def execute
    ActiveRecord::Base.transaction do
      clone_trip
      clone_pre_trip
      clone_schedule_days
      add_current_user
    end
    @new_trip
  end

  private
  def clone_trip
    @new_trip = @trip.dup
    @new_trip.is_published = false
    @new_trip.save
    @new_trip.schedule_days.destroy_all
    @new_trip.budget_sections.destroy_all

    CalculatePointsService.new(@trip).add_point_by_trip('clone')

  end

  def add_current_user
    UserTrip.create(user_id: @current_user.id, trip_id: @new_trip.id)
  end

  def clone_schedule_days
    @trip.schedule_days.each do |day|
      new_day = day.dup
      new_day.trip_id = @new_trip.id
      if new_day.save
        clone_attractions(day, new_day)
        clone_budget_section(day, new_day)
      end
    end
  end

  def clone_budget_section(day, new_day)
    new_day.budget_section.destroy
    new_budget_section = day.budget_section.dup
    new_budget_section.trip_id = @new_trip.id
    new_budget_section.schedule_day_id = new_day.id
    clone_budget_items(day.budget_section, new_budget_section) if new_budget_section.save
  end

  def clone_budget_items(budget_section, new_budget_section)
    budget_section.budget_items.each do |item|
      new_item = item.dup
      new_item.budget_section_id = new_budget_section.id
      new_item.save
    end
  end

  def clone_attractions(day, new_day)
    day.attractions.each do |attraction|
      new_attraction = attraction.dup
      new_attraction.schedule_day_id = new_day.id
      new_attraction.save
    end
  end

  def clone_pre_trip
    pre_trip = @trip.budget_sections.find_by(title: 'Pre-trip')
    new_pre_trip = pre_trip.dup
    new_pre_trip.trip_id = @new_trip.id
    new_pre_trip.save
    clone_budget_items(pre_trip, new_pre_trip)
  end
end
