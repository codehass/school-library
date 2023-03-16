require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#new' do
    it 'Creates an instance of Classroom' do
      classroom = Classroom.new('C1')
      expect(classroom).to be_instance_of Classroom
    end
  end

  describe '#add_student' do
    it 'Checks fo the add_student method' do
      new_student = Student.new(25, 'Ronald')
      new_classroom = Classroom.new('C1')
      new_classroom.add_student(new_student)
      expect(new_classroom.students).to include(new_student)
    end
  end
end
