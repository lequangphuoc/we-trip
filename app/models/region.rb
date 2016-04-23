# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ActiveRecord::Base
  has_many :places, dependent: :destroy
  validates_presence_of :name, :latitude, :longitude

  def self.get_starting_regions
    Region.where(id: Trip.all.collect(&:departure_id)).uniq
  end

  def self.get_region_by_name(name)
    Region.find_by(name: name)
  end

  def self.list_of_regions_by_departure(name)
    Region.where(id: Place.list_of_places_by_departure(name).pluck(:region_id))
  end

  def self.search_trips(departure, destination)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)

    @attractions = Attraction.where(place_id: Place.where(region_id: Region.where(id: @destination.id).pluck(:id)).pluck(:id))

    Trip.where(id: ScheduleDay.where(id: @attractions.collect(&:schedule_day_id)).pluck(:trip_id).uniq).where(departure_id: @departure.id)
  end

end
