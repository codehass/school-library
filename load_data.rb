class Loader
  def load_people(people)
    if File.exist?('./data/people.json')
      JSON.parse(File.read('./data/people.json')).each do |person|
        people << person
      end
    else
      people = []
    end
  end

  def load_books(books)
    if File.exist?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |book|
        books << book
      end
    else
      books = []
    end
  end

  def load_rentals(rentals)
    if File.exist?('./data/rentals.json')
      JSON.parse(File.read('./data/rentals.json')).each do |rental|
        rentals << rental
      end
    else
      rentals = []
    end
  end
end
