# == Schema Information
#
# Table name: user_trips
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  validates_presence_of :user_id, :trip_id
end
