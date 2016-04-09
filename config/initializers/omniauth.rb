OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '580989695401191', 'ea1b707d089e3fa41970e367d8ba2f80'
end