# Place.all.each do |place|
#   place.update_attributes(description: FFaker::Lorem.paragraph(20))
# end

users = []
20.times do |index|
  users << User.create(
      name: FFaker::Name.name,
      email: FFaker::Internet.email,
      password: "password-#{index}",
      description: FFaker::Lorem.paragraph(5),
      password_confirmation: "password-#{index}"
  )
end

users.each do |user|
  @service = FriendRelationsService.new(user, 1)
  @service.create
end
