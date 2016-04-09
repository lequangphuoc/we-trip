Place.all.each do |place|
  place.update_attributes(description: FFaker::Lorem.paragraph(20))
end