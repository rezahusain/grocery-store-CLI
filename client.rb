require './shop.rb'
require './customer.rb'
class Client

  def intro()
    puts "Welcome to Reza's Shop!"
    puts "-----------------------"

    puts "What's your name?"
    name = gets.chomp
    puts "Welcome #{name}!"
  end

  def menu(customer, shop)
    puts "\nYour current balance is $#{customer.total_cash}"
    puts "\nHere are your store options:"
    puts "1. Add to Cart"
    puts "2. Show the Store Items"
    puts "3. View the Shopping Cart"
    puts "4. Exit the Shop"
    puts "\nWhat's your selection?"
    
    selection = gets.chomp
    case selection.to_i
    #Add to Cart
    when 1
      puts "What's the name of the item you've selected?"
      item_name = gets.chomp
      customer.add_to_cart(shop.product_inventory, item_name.capitalize)
    #Show the Store Items
    when 2
      puts "\nHere's our menu:"
      puts shop.print_product_list()
    #View the Shopping Cart
    when 3
      customer.show_cart(shop.product_inventory)
    #Exit the Shop
    when 4
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
client.intro()
while true
  client.menu(customer, shop)
end
