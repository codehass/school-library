require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'

class App
  puts "Welcome to school library app!\n\n"
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Code to list all books
  def list_books
    if @books.empty?
      puts 'There are no books yet'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  # Code to list all people
  def list_people
    if @people.empty?
      puts 'There is no person'
    else
      @people.each do |person|
        puts "Name: #{person.name} ID: #{person.id} Age: #{person.age} Class: [#{person.class}] "
      end
    end
  end

  # Create a person (teacher or student)
  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_answer = gets.chomp.to_i

    case input_answer
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  # Create student

  def create_student
    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    print 'Has parent permission? [Y/N]:'
    parent_permission = gets.chomp

    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person created successfully'
  end

  # Create teacher

  def create_teacher
    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    print 'Specialization:'
    specialization = gets.chomp

    @people << Teacher.new(age, name, specialization: specialization)
    puts 'Person created successfully'
  end

  # Create a book
  def create_book
    print 'Author: '
    author = gets.chomp

    print 'Title: '
    title = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  # Code to create a rental
  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @people[person_index], @books[book_index])
      puts 'Rental created successfully'
    end
  end

  # list all rentals for a given person id
  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end

  # exit function
  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end
