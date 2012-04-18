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
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.action_view.javascript_expansions[:defaults] = %w(jquery-1.5.min rails app)
    config.active_record.whitelist_attributes
    config.encoding = "utf-8"
    config.filter_parameters += [:password, :password_confirmation]
    config.assets.enabled = true
    config.assets.debug = true
    config.cache_store = :dalli_store
  end
end
