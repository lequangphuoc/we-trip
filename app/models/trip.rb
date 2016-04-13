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
  belongs_to :departure, class_name: Region, foreign_key: :departure_id

  validates_presence_of :title
  validates_numericality_of :expected_budget
  validates_presence_of :departure_id, :description, :start_date, on: :update

  after_create :create_default_schedule_day

  def create_default_schedule_day
    self.schedule_days.create(index: 1, title: 'Day 1')
  end
end
