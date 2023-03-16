require_relative '../person'
require_relative '../rental'
require_relative '../book'
describe Person do
  describe '#new' do
    it 'Creates an instance of Person' do
      person = Person.new(40, 'Jack')
      expect(person).to be_instance_of Person
    end
  end
  it 'Check  if the can_use_services return parent permission value ' do
    person = Person.new(50, 'James')
    use_service = person.can_use_services?
    expect(use_service).to be true
  end
  it 'Check  if the correct_name method return name ' do
    person = Person.new(50, 'James')
    name = person.correct_name
    expect(name).to eq 'James'
  end
  it 'Check  if the add_rental return Rental ' do
    date = '2023/03/15'
    book = Book.new('Title', 'Author')
    person = Person.new(50, 'James')
    rental = book.add_rental(person, date)
    expect(rental).to be_instance_of Rental
  end
end
