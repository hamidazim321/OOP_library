require_relative 'app'
require_relative 'save_data'
require_relative 'load_data'

class Main
  def initialize
    @app = App.new
    @savedata = SaveData.new(@app)
    @loaddata = LoadData.new(@app)
  end

  private

  def save_data
    @savedata.handle_missing_files
    @savedata.save_books
    @savedata.save_people
    @savedata.save_rentals
  end

  def load_data
    @loaddata.load_books
    @loaddata.load_people
    @loaddata.load_rentals
  end

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
  def process_option(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thank you for using this app'
      save_data
      exit
    else
      puts 'Invalid option. Please choose a number between 1 and 7.'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  public

  def run
    load_data
    loop do
      display_menu
      option = gets.chomp.to_i
      process_option(option)
    end
  end  
end
Main.new.run
