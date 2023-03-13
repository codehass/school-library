require_relative './app'

class Main
  puts "Welcome to school library app!\n\n"
  def menu
    puts
    puts 'Please choose an option by entering a number'

    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end
    gets.chomp.to_i
  end
end

class Director
  def initialize(user_answer)
    @user_answer = user_answer
  end

  response = App.new

  case @user_answer
  when '1'
    response.list_books
  when '2'
    response.list_people
  when '3'
    response.create_person
  when '4'
    response.create_book
  when '5'
    response.create_rental
  when '6'
    response.list_rentals
  when '7'
    puts 'Thank you for using this app!'
    exit
  else
    puts 'Please choose a number between 1 and 7'
  end
end

test = Main.new
user_answer = test.menu
Director.new(user_answer)

# def main
#   Main.new
# end

# main
