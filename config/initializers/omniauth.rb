OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'],
           :image_size => {width: 200, height: 200},
           :scope => 'email,user_friends,user_photos',
           :display => 'popup'
end