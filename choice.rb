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

  if action.nil?
    puts 'Please choose a number between 1 and 7'
  else
    response.send(action)
  end
end

# exit function
def exit_app
  puts 'Thank you for using this app!'
  exit
end
