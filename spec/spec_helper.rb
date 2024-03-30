require 'capybara/rspec'
require 'selenium-webdriver'
# require 'webdrivers'
require_relative 'ui/pages/login_page'

# Webdrivers::Chromedriver.required_version = '123.0.6312.86'

# Capybara configuration
Capybara.configure do |config|
  config.default_max_wait_time = 5 # seconds
  config.default_driver = :selenium_chrome_headless
end

# Configure RSpec to use Capybara's features for system tests
RSpec.configure do |config|
  config.before(:all, type: :system) do
    # Configuration for Selenium and Capybara
    Capybara.server = :puma, { Silent: true }
    Capybara.javascript_driver = :selenium_chrome_headless
    Capybara.current_driver = :selenium_chrome_headless
    
    # Define options for Chrome
    Capybara.register_driver :selenium_chrome_headless do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      options.add_argument('--disable-gpu') # For Windows compatibility
      options.add_argument('--no-sandbox') # For CI environments
      options.add_argument('window-size=1920,1080')
      
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end

    # Global login setup for system tests
    login_page = LoginPage.new
    login_page.visit_login_page
    login_page.login(ENV['TEST_USER'], ENV['TEST_PASSWORD'])
  end

  # RSpec configurations
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
