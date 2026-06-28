require 'fileutils'

require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/order.rb'
require_relative './pages/components.rb'

Before do
  FileUtils.mkdir_p('logs/screenshots')

  @home = HomePage.new
  @checkout = CheckoutPage.new
  @order = OrderPage.new
  @popup = Popup.new
end

After do |scenario|
  next unless scenario.failed?

  screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  attach(screenshot, 'image/png', 'screenshot')
end
