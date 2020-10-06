require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
end

module IndyhackersRails
  class Application < Rails::Application
    config.app_generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_bot, :dir => "spec/factories"
    end

    config.active_record.whitelist_attributes
    config.encoding = "utf-8"
    config.filter_parameters += [:password, :password_confirmation]
    config.assets.enabled = true
    config.assets.precompile += [
      'responsive/width-0-969.css',
      'responsive/width-0-767.css',
      'responsive/width-480-969.css',
      'responsive/width-768-969.css',
      'responsive/width-480-767.css',
      'responsive/width-0-479.css',
    ]
    config.assets.debug = true
    config.cache_store = :mem_cache_store
  end
end
