Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions': {
        args: %w(no-sandbox headless disable-gpu window-size=1280,1024 disable-features=VizDisplayCompositor)
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

# Default server is puma in current day capybara. When/if the app transitions to puma, this line should be removed.
Capybara.server = :webrick
