OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'],
           :scope => 'email,user_about_me,user_friends,user_photos',
           :display => 'popup'
end