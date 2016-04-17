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
  has_many :attractions, -> { order(:index) }
  has_many :places, through: :attractions

  validates_presence_of :index, :trip_id

  def pairs_of_attractions
    count = self.attractions.size
    count >= 3 ? self.attractions[0..count-2].zip(self.attractions[1..count-1]) : []
  end

  def center_point
    average_latitude = has_place? ? self.places.map(&:latitude).reduce(&:+) / self.places.size : DEFAULT_LAT_AVG
    average_longitude = has_place? ? self.places.map(&:longitude).reduce(&:+) / self.places.size : DEFAULT_LNG_AVG
    {latitude: average_latitude, longitude: average_longitude}
  end

  private
  def has_place?
    self.places.size > 0
  end
end
