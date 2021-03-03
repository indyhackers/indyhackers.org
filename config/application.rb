require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IndyhackersRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.app_generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_bot, :dir => "spec/factories"
    end

    config.encoding = "utf-8"
    config.assets.enabled = true
    config.assets.debug = true
    config.cache_store = :mem_cache_store
  end
end
