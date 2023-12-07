require_relative 'app'

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

# rubocop:disable Metrics/CyclomaticComplexity
def process_option(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    puts 'Thank you for using this app'
    exit
  else
    puts 'Invalid option. Please choose a number between 1 and 7.'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def main
  app = App.new

  loop do
    display_menu
    option = gets.chomp.to_i
    process_option(option, app)
  end
end

main
