# == Schema Information
#
# Table name: place_photos
#
#  id              :integer          not null, primary key
#  place_id        :integer
#  photo_reference :string
#  height          :integer
#  width           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :place_photo, class: PlacePhoto do
    place_id '1'
    photo_reference 'test1'
    height '720'
    width '1280'
  end
end
