require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'ui/pages/login_page'

# Capybara configuration
Capybara.configure do |config|
  config.default_max_wait_time = 5 # seconds
  config.default_driver = :selenium_chrome_headless
end

# Configure RSpec to use Capybara's features for system tests
RSpec.configure do |config|
  config.before(:each, type: :system) do
    # Configuration for Selenium and Capybara
    Capybara.server = :puma, { Silent: true }
    Capybara.javascript_driver = :selenium_chrome_headless
    Capybara.current_driver = :selenium_chrome_headless
    
    # Define options for Chrome, including logging preferences
    Capybara.register_driver :selenium_chrome_headless do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      options.add_argument('--disable-gpu') # For Windows compatibility
      options.add_argument('--no-sandbox') # For CI environments
      options.add_argument('window-size=1920,1080')
      
      # Suppress console log messages about third-party cookies
      options.add_preference(:loggingPrefs, browser: 'OFF')
      
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end
  end
  # Enables detailed error messages for custom matchers.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  # Configures RSpec's mocking framework.
  config.mock_with :rspec do |mocks|
    # Ensures stubs/mocks match the real implementations.
    mocks.verify_partial_doubles = true
  end
  # Applies shared context metadata to all test groups automatically.
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
