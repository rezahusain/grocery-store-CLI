require './product.rb'

class Shop < Product
  attr_accessor :product_inventory

  def initialize()
    @product_inventory = {}
  end

  def add_product(product)
    self.product_inventory[product.name] = product.price
  end
end
