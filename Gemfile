source 'https://rubygems.org'

eval_gemfile 'Gemfile.rails-core'

# ==== General

gem 'kitsune_ds', path: '../engines/kitsune_ds'
gem 'meta-tags'
gem 'mission_control-jobs'
gem 'propshaft' # Required for mission_control-jobs
gem 'vite_rails'

# ==== ActiveStorage

# gem 'aws-sdk-s3'
gem 'image_processing', '~> 1.14'

# ==== Debugging

gem 'amazing_print', require: 'ap'
gem 'pry-rails'

# ==== HTTP

# gem 'faraday'
# gem 'faraday-retry'

# ==== Groups

group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/load'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 8.0'
end

group :development do
  gem 'rails-mermaid_erd', require: false
end

group :test do
  gem 'climate_control'
  gem 'simplecov', require: false
  gem 'single_cov', require: false
  gem 'webmock'
end

group :tools do
  gem 'ruby-lsp', require: false
  gem 'squasher'
end
