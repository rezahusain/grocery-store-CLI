require 'minitest/autorun'
require './customer.rb'

class TestCustomer < Minitest::Test
  def test_add_to_cart
    shop = Shop.new()
    customer = Customer.new()
    product_name = "Eggs"
    assert_equal 0, customer.add_to_cart(shop.product_inventory, product_name), "Item was added!"
  end

  def test_remove_from_cart
    shop = Shop.new()
    customer = Customer.new()
    product_name = "Eggs"
    customer.add_to_cart(shop.product_inventory, product_name)
    assert_equal 0, customer.remove_from_cart(shop.product_inventory, product_name), "Item was removed!"
  end
end
