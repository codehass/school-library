require_relative '../book'
require_relative '../person'
require_relative '../student'

describe Rental do
  describe '#Rental' do
    it 'Creates an instance of Rental' do
      student = Student.new(20, 'Jack', parent_permission: true)
      book = Book.new('Title', 'Author')
      date = '2023/01/01'
      rental = Rental.new(date, book, student)
      expect(rental).to be_instance_of Rental
    end
  end
end
