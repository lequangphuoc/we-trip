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

FactoryGirl.define do
  factory :user_trip, class: UserTrip do
  end
end
