# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  location_id    :string
#  rating         :decimal(, )
#  latitude       :decimal(, )
#  longitude      :decimal(, )
#  vicinity       :string
#  description    :text
#  region_id      :integer
#  default_budget :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :place, class: Place do
    name 'Tra Sua'
    location_id 'test1'
    rating 'nil'
    latitude '0.10529531E2'
    longitude '0.1050292207E3'
    vicinity 'HCM'
    region_id '1'
    default_budget '215176'
  end
end
