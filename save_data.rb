require 'fileutils'
require 'json'
class SaveData
  def initialize(app)
    @app = app
  end

  def handle_missing_files
    required_files = ['books.json', 'rentals.json', 'people.json']
    required_files.each do |file|
      FileUtils.touch("#{Dir.pwd}/#{file}") unless File.exist?(file)
    end
  end

  def save_people
    people = @app.people.map do |person|
      object = {
        type: person.class.name,
        name: person.name,
        id: person.id,
        age: person.age,
        parent_permission: person.parent_permission
      }
      object['specialization'] = person.specialization if person.respond_to? :specialization
      object
    end
    filename = 'people.json'
    File.write(filename, JSON.pretty_generate(people))
  end

  def save_books
    books = @app.books.map do |book|
      {
        title: book.title,
        author: book.author,
        id: book.id
      }
    end
    filename = 'books.json'
    File.write(filename, JSON.pretty_generate(books))
  end

  def save_rentals
    rentals = @app.rentals.map do |rental|
      {
        date: rental.date,
        book: rental.book.id,
        person: rental.person.id
      }
    end
    filename = 'rentals.json'
    File.write(filename, JSON.pretty_generate(rentals))
  end
end