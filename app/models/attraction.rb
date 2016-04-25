# == Schema Information
#
# Table name: attractions
#
#  id              :integer          not null, primary key
#  schedule_day_id :integer
#  place_id        :integer
#  index           :integer
#  hour_spend      :decimal(, )      default("1")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  distance        :string
#  duration        :string
#

class Attraction < ActiveRecord::Base
  belongs_to :schedule_day
  belongs_to :place

  validates_presence_of :place_id, :schedule_day_id, :index
  validates_numericality_of :hour_spend

  def get_region
    Region.where(place_id: place_id)
  end

  def get_trip
    self.schedule_day.trip
  end

  def self.list_of_attractions_by_departure(name)
    Attraction.where(schedule_day_id: ScheduleDay.list_of_schedule_day_by_departure(name))
  end
end
