require 'rspec'

class CheckoutPage
  include Capybara::DSL
  include RSpec::Matchers

  def assert_product_details(product)
    product_title = find('.item-details h1')
    expect(product_title.text).to eq product[:name]

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql product[:price]

    delivery = find('.delivery-price')
    expect(delivery.text).to eql product[:delivery]
  end

  def assert_total_price(total_price)
    price = find('.total-price')
    expect(price.text).to eql total_price
  end

  def find_zipcode(zipcode)
    find('input[name=cep]').set(zipcode)
    click_on 'Buscar CEP'
  end

  def fill_address(address)
    find('input[name=number]').set(address[:Numero])
    find('input[name=complement]').set(address[:Complemento])
  end

  def choice_payment(payment_type)
    find('label div', text: payment_type.upcase).click
  end

  def submit_order
    click_on 'Confirmar pedido'
  end
end