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
#

class Attraction < ActiveRecord::Base
  belongs_to :schedule_day
  belongs_to :place

  validates_presence_of :place_id, :schedule_day_id, :index
  validates_numericality_of :hour_spend
end
