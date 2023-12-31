# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.8"

# Global gems
gem "bootsnap", require: false
gem "devise"
gem "enumerize"
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "sidekiq"
gem "simple_form"
gem "slim-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "view_component"

# Omniauth gems
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "omniauth-twitter"
gem "omniauth"

group :development, :test do
  gem "annotate"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails", "~> 6.2"
  gem "faker"
  gem "pry-byebug"
  gem "rspec-rails", "~> 6.0.0"
  gem "rubocop-rails", require: false
  gem "shoulda-matchers"
end

group :development do
  gem "web-console"
end
