require "./shop.rb"

class Customer < Shop
  attr_accessor :shopping_cart, :budget, :cart_value

  def initialize()
    @shopping_cart = []
    @budget = 100
    @cart_value = 0
  end
  def add_to_cart(product_inventory, product_name)

    # Check if the product is within the product inventory
    if product_inventory.key?(product_name)

      # Adds product name to shopping cart
      self.shopping_cart.append(product_name)

      # Adds the value of the product to a variable which holds the total shopping cart value
      self.cart_value += product_inventory[product_name]

      puts "#{product_name} has been added to your shopping cart."
    else
      pp "#{product_name} is currently not in the shop! Check at a later time."
    end
  end

  def remove_from_cart(product_inventory, product_name)

    # Check if the shopping cart contains the product
    if shopping_cart.include?(product_name)
      
      # Delete the product from the shopping cart
      self.shopping_cart.delete_at(shopping_cart.index(product_name))

      # Subtract the deleted product value from the cart value
      self.cart_value -= product_inventory[product_name]

      puts "#{product_name} has been removed from your shopping cart."
    else
      puts "#{product_name} is not present in the shopping cart! Please type in an item which is within your shopping cart."
    end
  end
  def purchase()
    # Check if the current customer budget is greater than the cart value
    if self.budget > self.cart_value

      # Empty the shopping cart
      self.shopping_cart.clear()

      # Subtract the customer budget from the cart value
      self.budget -= self.cart_value

      # Set the cart value back to 0
      self.cart_value = 0
    else
      puts "You can't afford these items! Remove some and then try again."
    end
  end
  def show_cart(product_inventory)

    # Create a hash from the shopping cart array which contains the name and frequency of the products within
    item_frequency = self.shopping_cart.each_with_object(Hash.new) do |name, frequency|
      if frequency[name]
        frequency[name] += 1
      else
        frequency[name] = 1
      end
    end
    puts "|Name| |Quantity| |Total Price|"
    puts "-------------------------------"

    # Loop through the hash created previously and list out the details of each product
    item_frequency.each do |name, amount|
      puts "|#{name}| |#{amount}| |$#{amount * product_inventory[name]}|"
    end
    puts "Your total cart values up to $#{self.cart_value}!"
  end
end
