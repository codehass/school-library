require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './classroom'
require_relative './load_data'
require 'json'

class App
  puts "Welcome to school library app!\n\n"
  def initialize
    @books = []
    @people = []
    @rentals = []
    loader = Loader.new
    loader.load_people(@people)
    loader.load_books(@books)
    loader.load_rentals(@rentals)
  end

  # Code to list all books
  def list_books
    if @books.empty?
      puts 'There are no books yet'
    else
      @books.each do |hash|
        puts "title: #{hash['title']}   Author: #{hash['author']} "
      end
    end
  end

  # Code to list all people
  def list_people
    if @people.empty?
      puts 'There is no person'
    else
      @people.each do |hash|
        puts "Name: #{hash['name']}   Age: #{hash['age']} ID: #{hash['id']} Class: #{hash['class']}"
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
    student_hash = {
      'age' => student.instance_variable_get('@age'),
      'name' => student.instance_variable_get('@name'),
      'parent_permission' => student.instance_variable_get('@parent_permission'),
      'id' => student.instance_variable_get('@id'),
      'class' => student.class
    }

    @people << student_hash
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

    teacher = Teacher.new(age, name, specialization: specialization)
    teacher_hash = {
      'age' => teacher.instance_variable_get('@age'),
      'name' => teacher.instance_variable_get('@name'),
      'specialization' => teacher.instance_variable_get('@specialization'),
      'id' => teacher.instance_variable_get('@id'),
      'class' => teacher.class
    }

    @people << teacher_hash
    puts 'Person created successfully'
  end

  # Create a book
  def create_book
    print 'Author: '
    author = gets.chomp

    print 'Title: '
    title = gets.chomp

    book = Book.new(title, author)
    book_hash = {
      'title' => book.instance_variable_get('@title'),
      'author' => book.instance_variable_get('@author')
    }

    @books << book_hash

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
        puts "#{index + 1}) Title: #{book['title']}, Author: #{book['author']}"
      end

      book_name = @books[gets.chomp.to_i - 1]['title']

      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index + 1}) [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end

      person_id = @people[gets.chomp.to_i - 1]['id']

      print 'Date: '
      date = gets.chomp
      puts
      rental_hash(book_name, person_id, date)

    end
  end

  def rental_hash(book_name, person_id, date)
    rental = {
      'book' => book_name,
      'persons' => person_id,
      'date' => date
    }

    @rentals << rental
    puts 'Rental created successfully'
  end

  # list all rentals for a given person id
  def list_rentals
    puts
    print 'ID of person: '

    selected_id = gets.chomp.to_i

    puts 'Rentals: '
    found_person = @people.find { |person| person['id'] == selected_id }
    found_rental = @rentals.find { |rental| rental['persons'] == selected_id }

    if found_person && found_rental
      puts "Date: #{found_rental['date']}, Book #{found_rental['book']} by #{found_person['name']}"
    else
      puts 'ID not found'
    end
  end

  # exit function
  def exit_app
    File.write('./data/people.json', JSON.generate(@people))
    File.write('./data/books.json', JSON.generate(@books))
    File.write('./data/rentals.json', JSON.generate(@rentals))
    puts 'Thank you for using this app!'
    exit
  end
end
