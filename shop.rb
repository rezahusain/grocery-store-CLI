require './product.rb'

class Shop < Product
  attr_accessor :product_inventory

  def initialize()
    @product_inventory = {"Milk" => 3.50, "Eggs" => 2.50, "Cheese" => 1.00}
  end

  def add_product(product)
    self.product_inventory[product.name.capitalize] = product.price
  end

  def print_product_list()
    product_inventory.each do |name, price|
      puts "#{name}: $#{price}"
    end
  end
end
