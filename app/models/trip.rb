# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  start_date      :datetime
#  departure_id    :integer
#  title           :string
#  description     :text
#  expected_budget :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Trip < ActiveRecord::Base
  has_many :user_trips
  has_many :schedule_days
  has_many :users, through: :user_trips
  has_many :attractions, through: :schedule_days
  belongs_to :departure, class_name: Region, foreign_key: :departure_id

  validates_presence_of :title
  validates_numericality_of :expected_budget
  validates_presence_of :departure_id, :description, :start_date, on: :update

  after_create :create_default_schedule_day

  def create_default_schedule_day
    self.schedule_days.create(index: 1)
  end

  def users_except_current
    User.where('id IN (?) AND id != (?)', self.users.pluck(:id), self.id)
  end

  # def self.list_of_destination_regions
  #   @attractions = Attraction.all.preload(:place)
  #   @regions = []
  #   @attractions.each do |attraction|
  #     @regions << attraction.place.region.name
  #   end
  #   @regions.uniq
  # end

  def list_of_attractions
    Attraction.where(schedule_day_id: schedule_day_ids)
  end

  def self.trips_start_at_departure(name)
    Trip.where(departure_id: Region.find_by(name: name).id).uniq
  end

  def self.search_trips(departure, destination)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)

    @attractions = Attraction.where(place_id: Place.where(region_id: Region.where(id: @destination.id).pluck(:id)).pluck(:id))

    Trip.where(id: ScheduleDay.where(id: @attractions.collect(&:schedule_day_id)).pluck(:trip_id).uniq).where(departure_id: @departure.id)
  end
end
