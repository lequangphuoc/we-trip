FactoryGirl.define do
  factory :place_photo, class: PlacePhoto do
    place_id '1'
    photo_reference 'test1'
    height '720'
    width '1280'
  end
end
