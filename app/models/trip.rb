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
#  is_published    :boolean          default("false")
#

class Trip < ActiveRecord::Base
  DEFAULT_PHOTO = 'https://www.mariecuriealumni.eu/sites/default/files/styles/50x50_avatar/public/pictures/picture-default.jpg?itok=uk4ugbrt'

  has_many :user_trips, dependent: :destroy
  has_many :schedule_days, dependent: :destroy
  has_many :users, through: :user_trips
  has_many :attractions, through: :schedule_days
  belongs_to :departure, class_name: Region, foreign_key: :departure_id
  has_many :budget_sections, dependent: :destroy
  has_many :budget_items, through: :budget_sections
  has_many :user_budgets, through: :budget_items
  has_many :attachments, dependent: :destroy
  has_many :places, through: :attractions
  has_many :place_photos, through: :places

  validates_presence_of :title
  validates_numericality_of :expected_budget
  validates_presence_of :departure_id, :description, :start_date, on: :update
  after_create :create_default_schedule_day

  def create_default_schedule_day
    self.schedule_days.create(index: 1)
    self.budget_sections.create(title: 'Pre-trip')
  end

  def display_photo
    place_photos.empty? ? DEFAULT_PHOTO : place_photos.order("RANDOM()").first.decorate.url(600)
  end

  def is_owner?(current_user_id)
    user_ids.include?(current_user_id)
  end

  def total_money
    sections = self.budget_sections.includes(:budget_items)
    sections.reduce(0) { |total_money, budget_section|
      total_money + budget_section.budget_items.map(&:price).inject(0, &:+)
    }
  end

  def users_except_current(current_user_id)
    User.where('id IN (?) AND id != (?)', self.users.pluck(:id), current_user_id)
  end

  def list_of_attractions
    Attraction.where(schedule_day_id: schedule_day_ids)
  end

  def self.trips_start_at_departure(name)
    Trip.where(departure_id: Region.find_by(name: name).id).uniq
  end

  def self.search_trips(departure, destination)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)

    if @departure != nil && @destination != nil
      @attractions = Attraction.where(place_id: Place.where(region_id: Region.where(id: @destination.id).pluck(:id)).pluck(:id))

      Trip.where(id: ScheduleDay.where(id: @attractions.collect(&:schedule_day_id)).pluck(:trip_id).uniq).where(departure_id: @departure.id)
    end
  end
end
