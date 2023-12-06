require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
  end

  private
  def select_person
    puts "Select a person from the following (not ID)"
    @people.each_with_index do |person, index|
      puts " #{index}) [#{person.class}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print "Enter the index of the person: "
    index_input = gets.chomp.to_i
  end

  def select_book
    puts "Select a book from the following"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    print "Enter the index of the book: "
    index_input = gets.chomp.to_i
  end

  def create_student(name, age)
    print "Has parent permission? [Y/N]: "
      permission = gets.chomp
      has_permission = permission.capitalize == 'Y'
      student = Student.new(age, name, parent_permission: has_permission)
      @people.push(student)
      puts "Student Created successfully"
  end

  def create_teacher(name, age)
    print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people.push(teacher)
      puts "Teacher Created successfully"
  end
  public

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts "Do you want to create a student (1) or a teacher (2)"
    option = gets.chomp.to_i
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    if option == 1
      create_student(name, age)
    else
      create_teacher(name, age)
    end
    puts "Person Created Successfully!"
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book Created Successfully!"
  end

  def create_rental
    print "Date: "
    date = gets.chomp
    book_index = select_book
    person_index = select_person
    Rental.new(date, @books[book_index], @people[person_index])
    puts "Rental Created Successfully"
  end

  def list_rentals
    print "ID of the person: "
    input_id = gets.chomp.to_i
    person = @people.select{ |person| person.id = input_id}
    puts person.rentals
  end
end