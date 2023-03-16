require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  describe '#new' do
    it 'Creates an instance of Book' do
      book = Book.new('Title', 'Author')
      expect(book).to be_instance_of Book
    end
  end

  it 'Check  if the add_rental return Rental ' do
    date = '2023/03/15'
    book = Book.new('Title', 'Author')
    person = Person.new(20, 'ali')
    rental = book.add_rental(person, date)
    expect(rental).to be_instance_of Rental
  end
end
