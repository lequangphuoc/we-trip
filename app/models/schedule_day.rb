# == Schema Information
#
# Table name: schedule_days
#
#  id         :integer          not null, primary key
#  index      :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduleDay < ActiveRecord::Base
  DEFAULT_LAT_AVG = 14.0583
  DEFAULT_LNG_AVG = 108.2772

  belongs_to :trip
  has_many :attractions, -> { order(:index) }, dependent: :destroy
  has_many :places, through: :attractions
  has_one :budget_section, dependent: :destroy

  validates_presence_of :index, :trip_id
  after_create :init_budget_section

  def init_budget_section
    self.create_budget_section(trip_id: self.trip_id)
  end

  def pairs_of_attractions
    count = self.attractions.size
    count >= 2 ? self.attractions[0..count-2].zip(self.attractions[1..count-1]) : []
  end

  def center_point
    average_latitude = has_place? ? self.places.map(&:latitude).reduce(&:+) / self.places.size : DEFAULT_LAT_AVG
    average_longitude = has_place? ? self.places.map(&:longitude).reduce(&:+) / self.places.size : DEFAULT_LNG_AVG
    {latitude: average_latitude, longitude: average_longitude}
  end

  def self.list_of_schedule_day_by_departure(name)
    ScheduleDay.where(trip_id: Trip.trips_start_at_departure(name).pluck(:id))
  end

  private
  def has_place?
    self.places.size > 0
  end
end
