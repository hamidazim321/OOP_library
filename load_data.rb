require 'json'
require_relative 'app'

class LoadData
  def initialize(app)
    @app = app
  end

  def get_file_json(filename)
    path = "#{Dir.pwd}/#{filename}"
    return nil unless File.exist?(filename)

    data = File.read(path)
    JSON.parse(data)
  end

  def load_books
    books = get_file_json('books.json')
    return if people.nil?

    books.each do |book|
      new_book = Book.new(book['author'], book['title'])
      new_book.id = book['id']
      @app.books.push(new_book)
    end
  end

  def load_people
    people = get_file_json('people.json')
    return if people.nil?

    people.each do |person|
      if person['type'] == 'Student'
        student = Student.new(person['age'], person['name'])
        student.parent_permission = person['parent_permission']
        student.id = person['id']
        student.classroom = person['classroom'] if person['classroom']
        @app.people.push(student)
      elsif person['type'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        teacher.id = person['id']
        @app.people.push(teacher)
      end
    end
  end

  def load_rentals
    rentals = get_file_json('rentals.json')
    return if rentals.nil?

    rentals.each do |rental|
      results_person = @app.people.find { |person| person.id == rental['person'] }
      result_book = @app.people.find { |book| book.id == rental['book'] }
      new_rental = Rental.new(rental['date'], result_book, results_person) if results_person && result_book
      @app.rentals.push(new_rental)
    end
  end
end
