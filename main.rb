require_relative './app'

# Ask the user for the choice
class Main
  def menu
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

# handel the choices
def choice(user_answer, response)
  actions = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals,
    7 => :exit_app
  }

  action = actions[user_answer]

  response.send(action)
end

def main
  response = App.new

  loop do
    puts 'Please choose an option by entering a number'
    user_answer = Main.new.menu
    choice user_answer, response
  end
end

main
