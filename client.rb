require './shop.rb'
class Client

  def intro()
    puts "Welcome to Reza's Shop!"
    puts "-----------------------"

    puts "What's your name?"
    name = gets.chomp

    puts "Welcome #{name}!"
  end

  def menu()
    puts "\nHere's our menu:"
    shop = Shop.new()
    puts shop.print_product_list()
    puts "\nHere are your store options:"
    puts "1. Add To Cart"
    puts "\nWhat's your selection?"
    
    selection = gets.chomp
    switch(selection)
  end
end

client = Client.new()
client.intro()
while true
  client.menu()
  break
end
