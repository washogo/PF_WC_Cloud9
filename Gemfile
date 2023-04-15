source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '~> 5.2.5'
gem 'rails', '~> 6.0'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '>= 4.0'
# Use SCSS for stylesheets
gem 'sassc', '2.1.0'
gem 'sass-rails', '6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.38'
  gem 'selenium-webdriver'
  gem 'poltergeist', '~> 1.18', '>= 1.18.1'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '~> 5.2'
  gem 'database_cleaner'
  gem 'launchy'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# bootstrap導入
gem 'bootstrap', '~> 5.0.2'

# bootstrapはjQueryに依存しているため
gem 'jquery-rails'

# deviseの導入
gem 'devise'
gem 'omniauth-rails_csrf_protection'
# google認証
gem 'omniauth-google-oauth2'
# facebook認証
gem 'omniauth-facebook'
# twitter認証
gem 'omniauth-twitter'

# refileの導入
gem 'refile', '0.6.2', git: 'https://github.com/manfe/refile.git'
gem 'refile-mini_magick', git: 'https://github.com/refile/refile-mini_magick.git'

# enumで定義した値をi18n化させて日本語に変換する
gem 'enum_help'

# RSpecの導入
gem 'rspec-rails', '4.0.0.beta2'
# gem 'rspec-rails', '4.0.0'
gem 'factory_bot_rails'

gem 'dotenv-rails'

group :production do
  gem 'mysql2'
end

# 日本語化
gem 'rails-i18n'

gem 'listen', '>= 3.0.5', '< 3.2'

gem 'google-apis-drive_v3'
gem 'google-api-client', require: 'google/apis/calendar_v3'
