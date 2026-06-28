class HomePage
  include Capybara::DSL

  BASE_URL = ENV.fetch('STARBUGS_BASE_URL', 'https://starbugs-qa.vercel.app')

  def open
    visit BASE_URL
  end

  def coffee_list
    all('.coffee-item')
  end

  def buy(coffee_name)
    product = find('.coffee-item', text: coffee_name)
    product.find('.buy-coffee').click
  end
end
