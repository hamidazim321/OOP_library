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
