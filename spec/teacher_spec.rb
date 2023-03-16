require_relative '../teacher'
describe Teacher do
  describe '#new' do
    it 'Creates an instance of Teacher' do
      teacher = Teacher.new(50, 'Jack', specialization: 'math')
      expect(teacher).to be_instance_of Teacher
    end
    it 'Check  of the can_use_services? method ' do
      teacher = Teacher.new(50, 'Jack', specialization: 'math')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
