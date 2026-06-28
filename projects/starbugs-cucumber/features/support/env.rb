require 'capybara/cucumber'
require 'selenium-webdriver'

headless_options = Selenium::WebDriver::Chrome::Options.new
headless_options.add_argument('--headless=new')
headless_options.add_argument('--disable-gpu')
headless_options.add_argument('--no-sandbox')
headless_options.add_argument('--disable-dev-shm-usage')
headless_options.add_argument('--window-size=1440,900')

Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: headless_options)
end

Capybara.configure do |config|
  config.default_driver = ENV.fetch(
    'CAPYBARA_DRIVER',
    ENV['CI'] ? 'selenium_chrome_headless' : 'selenium_chrome'
  ).to_sym
  config.default_max_wait_time = 5
end
