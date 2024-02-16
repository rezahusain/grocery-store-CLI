require './shop.rb'
require './customer.rb'
class Client

  def intro()
    puts "Welcome to Reza's Shop!"
    puts "-----------------------"

    puts "What's your name?"
    name = gets.chomp
    return name
  end

  def menu(customer, shop, name)
    puts "\n#{name}'s current balance is $#{customer.budget}"
    puts "\nHere are your store options:"
    puts "1. Add to Cart"
    puts "2. Remove from Cart"
    puts "3. Show the Store Items"
    puts "4. View the Shopping Cart"
    puts "5. Purchase Items"
    puts "6. Exit the Shop"
    puts "\nWhat's your selection?"
    
    selection = gets.chomp
    case selection.to_i
    #Add to Cart
    when 1
      puts "What's the name of the item you've selected?"
      item_name = gets.chomp
      customer.add_to_cart(shop.product_inventory, item_name.capitalize)
    #Remove from Cart
    when 2
      puts "What's the name of the item you want to delete??"
      item_name = gets.chomp
      customer.remove_from_cart(shop.product_inventory, item_name.capitalize)
    #Show the Store Items
    when 3
      puts "\nHere's our menu:"
      puts shop.print_product_list()
    #View the Shopping Cart
    when 4
      customer.show_cart(shop.product_inventory)
    #Purchase Items
    when 5
      customer.purchase()
    #Exit the Shop
    when 6
      abort("You have exited Reza's Shop. Please come again!")
    else
      puts "That's an invalid choice. Please select again!"
    end
  end
end

#Create instances of the customer, shop, and client class
customer = Customer.new()
shop = Shop.new()
client = Client.new()
name = client.intro()
# While the user hasn't exited the shop, continue showing the menu after every action
while true
  client.menu(customer, shop, name)
end
