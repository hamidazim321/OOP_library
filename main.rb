require_relative 'app'
require_relative 'process_options'
require_relative 'display_menu'

def display_menu
  puts 'Please choose an option by entering a number'
  puts '1 - List all books'
  puts '2 - List all people.'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def main
  app = App.new

  loop do
    display_menu
    option = gets.chomp.to_i
    process_option(option, app)
  end
end

main
