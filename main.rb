require_relative './app'
require_relative './choice'

# Ask the user for the choice
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

# app controller
def main
  response = App.new
  user_answer = Main.new.menu
  choice user_answer, response
end

main
