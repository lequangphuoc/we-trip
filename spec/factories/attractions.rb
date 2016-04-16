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
#  distance        :string
#  duration        :string
#

FactoryGirl.define do
  factory :attraction1, class: Attraction do
    index 1
    hour_spend 1
  end

  factory :attraction2, class: Attraction do
    index 2
    hour_spend 2
  end

  factory :attraction3, class: Attraction do
    index 3
    hour_spend 3
  end
end
