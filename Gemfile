source 'https://rubygems.org'

# ==== Rails Core ==============================================================

gem 'rails', '~> 8.0.3'

# --- Databases

gem 'pg'

# --- Server

gem 'bootsnap', require: false
gem 'puma', '>= 5.0'
gem 'thruster', require: false

# --- Frontend

gem 'importmap-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# --- Database-backed adapters for Rails.cache, Active Job, and Action Cable

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

# --- Deployment

gem 'kamal', require: false

# ==== Application =============================================================

# --- General

gem 'vite_rails'

# --- Authentication

# gem 'jwt'

# --- ActionView

gem 'meta-tags'

# --- ActiveModel and ActiveRecord

# gem 'bcrypt'

# --- ActiveJob

# --- ActiveStorage

# gem 'aws-sdk-s3'
gem 'image_processing', '~> 1.2'

# --- Debugging

gem 'amazing_print', require: 'ap'
gem 'pry-rails'

# --- HTTP

# gem 'faraday'
# gem 'faraday-retry'

# ==== Groups ==================================================================

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri], require: 'debug/prelude'
  gem 'dotenv-rails', require: 'dotenv/load'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 8.0'
end

group :development do
  gem 'annotaterb'
  gem 'rails-erd'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'climate_control'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'single_cov', require: false
  gem 'webmock'
end

# group :production do
# end

group :tools do
  gem 'rubocop-rails-omakase', require: false
  gem 'ruby-lsp', require: false
  gem 'squasher'
end
