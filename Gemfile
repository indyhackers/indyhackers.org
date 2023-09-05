source "https://rubygems.org"
ruby "3.1.4"

gem "rails", "~> 7.0"

gem "pg", "~> 1.1"

gem "haml", "~> 6.1.1"
gem "sass-rails"
gem "uglifier"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

gem "jquery-rails"
gem "simple_form"

gem "devise", "4.9.2"
gem "kaminari"
gem "redcarpet"

gem "slugged"
gem "stringex"

gem "json_pure"
gem "puma", "~> 5.0"

gem "dalli"
gem "inline_svg"
gem "memcachier"

gem "test-unit"

gem "rack-cache"

group :development, :test do
  gem "deadweight"
  gem "foreman"
  gem "launchy"
  gem "spork"

  gem "hpricot"

  gem "pry-rails"
  gem "rb-readline"

  gem "rspec-rails", "~> 6.0.2"

  gem "brakeman"
  gem "bundler-audit"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"

  gem "factory_bot_rails"
  gem "faker"
  gem "matrix"
  gem "simplecov", require: false
end
