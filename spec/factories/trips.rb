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

FactoryGirl.define do
  factory :trip1, class: Trip do
    title 'Trip 1'
    expected_budget 100000
  end

  factory :trip2, class: Trip do
    title 'Trip 2'
    expected_budget 200000
    start_date Time.now
    description 'description'
  end
end
