require "./shop.rb"

class Customer < Shop
  attr_accessor :shopping_cart, :total_cash

  def initialize()
    @shopping_cart = []
    @total_cash = 100
  end
  def add_to_cart(product_inventory, product_name)
    if product_inventory.key?(product_name)
      if product_inventory[product_name] < self.total_cash
        self.shopping_cart.append(product_name)
        self.total_cash = self.total_cash - product_inventory[product_name]
      else
        pp "You dont have enough money to purchase #{product_name}! You currently have $#{self.total_cash} dollars."
      end
    else
      pp "#{product_name} is currently not in the shop! Check at a later time."
    end
  end
  def show_cart(product_inventory)
    item_frequency = self.shopping_cart.each_with_object(Hash.new) do |name, frequency|
      if frequency[name]
        frequency[name] += 1
      else
        frequency[name] = 1
      end
    end
    puts "|Name| |Quantity| |Total Price|"
    puts "-------------------------------"
    item_frequency.each do |name, amount|
      puts "|#{name}| |#{amount}| |$#{amount * product_inventory[name]}|"
    end
  end
end
