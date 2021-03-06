source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# handlebars
gem 'handlebars_assets'
# boostrap
#gem 'bootstrap', '~> 4.0.0.alpha1'
# authentication
gem 'devise'
# toast
gem 'toastr-rails'
# Fake data
gem 'ffaker'
# Decorators
gem 'draper'
# Pagination
gem 'kaminari'
# figaro
gem 'figaro'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# image upload
gem 'mini_magick'
gem 'carrierwave-aws'
gem 'aws_cf_signer'
# omniauth
gem 'omniauth'
gem 'omniauth-facebook', '~> 3.0.0'
# remotipart
gem 'remotipart', '~> 1.2'
# http
gem 'httparty'
# puma
gem 'puma'
# dumbing database
gem 'yaml_db'
# Graph API
gem 'koala', '~> 2.2'
# ui libaries
gem 'Bootstrap-Image-Gallery-rails'
gem 'jquery-ui-rails'
gem 'jquery-easing-rails'
gem 'tag-it-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'twitter-typeahead-rails'
gem 'jquery-slick-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

group :production do
  # deploy heroku helper
  gem 'rails_12factor'
end

group :test do
  # Speed up test
  gem 'spring'
  gem 'spring-commands-rspec'

  # Testing framework go here
  gem 'rspec-rails'

  # Database cleaner
  gem 'database_cleaner'

  # Add matcher
  gem 'shoulda-matchers'

  # Test datas
  gem 'factory_girl_rails'

  # Acceptance test
  gem 'capybara'
  gem 'selenium-webdriver'

  # Test coverages
  gem 'simplecov', :require => false
  gem 'coveralls', require: false

  # add annotation for model classes
  gem 'annotate'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
