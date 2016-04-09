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
