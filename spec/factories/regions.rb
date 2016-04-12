# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :hcm, class: Region do
    name 'HCM'
    latitude 1.777
    longitude 2.555
  end

  factory :hn, class: Region do
    name 'HN'
    latitude 2.982
    longitude 3.123
  end
end
