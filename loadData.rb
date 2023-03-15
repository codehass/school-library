class Loader
  def load_people(people)
    if File.exist?('./people.json')
      JSON.parse(File.read('./people.json')).each do |person|
        people << person
      end
    else
      people = []
    end
  end
  def load_books(books)
    if File.exist?('./books.json')
      JSON.parse(File.read('./books.json')).each do |book|
        books << book
      end
    else
      books = []
    end
  end
  def load_rentals(rentals)
    if File.exist?('./rentals.json')
      JSON.parse(File.read('./rentals.json')).each do |rental|
        rentals << rental
      end
    else
      rentals = []
    end
  end
end