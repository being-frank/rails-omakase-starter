source 'https://rubygems.org'

# ==== Rails Core ==============================================================

gem 'rails', '~> 8.0.2'

# -- Server
gem 'puma', '>= 5.0'
gem 'thruster', require: false # https://github.com/basecamp/thruster/

# -- Databases
gem 'pg'
gem 'redis'
gem 'sqlite3'

# -- Frontend
gem 'importmap-rails'
gem 'propshaft'
gem 'stimulus-rails'
gem 'turbo-rails'

# -- Database-backed adapters for Rails.cache, Active Job, and Action Cable
gem 'solid_cache'
gem 'solid_queue'
gem 'solid_cable'

# -- Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# -- Deployment
gem 'kamal', require: false # https://kamal-deploy.org

# ==== Application =============================================================

# -- General

# -- Authentication
# gem 'jwt'

# -- ActionView

# -- ActiveModel and ActiveRecord
# gem 'bcrypt'

# -- ActiveJob

# -- ActiveStorage
# gem 'aws-sdk-s3'
# gem 'image_processing', '~> 1.2'

# -- Debugging
gem 'amazing_print', require: 'ap'
gem 'pry-rails'
gem 'pry-stack_explorer'

# -- HTTP
# gem 'faraday'
# gem 'faraday-retry'

# ==== Groups ==================================================================

group :development, :test do
  gem 'debug', platforms: %i[mri], require: 'debug/prelude'
  gem 'brakeman', require: false
end

group :development do
  # gem 'listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webmock'
end

# group :production do
# end

group :tools do
  gem 'rubocop-rails-omakase', require: false # https://github.com/rails/rubocop-rails-omakase/
  gem 'ruby-lsp', require: false
  gem 'squasher'
end
