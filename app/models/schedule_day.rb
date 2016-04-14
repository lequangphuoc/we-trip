# == Schema Information
#
# Table name: schedule_days
#
#  id         :integer          not null, primary key
#  title      :string
#  index      :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScheduleDay < ActiveRecord::Base
  belongs_to :trip
  has_many :attractions, -> { order(:index) }

  validates_presence_of :title, :index, :trip_id
end
