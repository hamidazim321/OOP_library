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
    if age < 18
      print "Has parent permission? [Y/N]: "
        permission = gets.chomp
        has_permission = permission.capitalize == 'Y'
        student = Student.new(age, name, parent_permission: has_permission)
        @people.push(student)
        return
    else
      student = Student.new(age, name)
      @people.push(student)
      return
    end
  end

  def create_teacher(name, age)
    print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @people.push(teacher)
  end
  public

  def list_books
    puts "Books:"
    @books.each_with_index do |book, index|
      puts "  #{index}) Title: #{book.title}, Author: #{book.author}"
    end
    puts
  end

  def list_people
    puts "People:"
    @people.each do |person|
      puts "  [#{person.class.name}], Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts
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
    puts
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book Created Successfully!"
    puts
  end

  def create_rental
    print "Date: "
    date = gets.chomp
    book_index = select_book
    person_index = select_person
    Rental.new(date, @books[book_index], @people[person_index])
    puts "Rental Created Successfully"
    puts
  end

  def list_rentals
    print "ID of the person: "
    input_id = gets.chomp.to_i
    person = @people.find{ |person| person.id == input_id}
    puts "Rentals:"
    person.rentals.each_with_index do |rental, index|
      puts "  #{index}) Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
    puts
  end
end