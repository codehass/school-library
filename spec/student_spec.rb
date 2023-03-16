require_relative '../student'
require_relative '../classroom'

describe Student do
  describe '#new' do
    it 'Creates an instance of Student' do
      student = Student.new(40, 'Jack', parent_permission: true)
      expect(student).to be_instance_of Student
    end
  end

  it 'Check  of the add_classroom method ' do
    classroom = Classroom.new('C1')
    student = Student.new(40, 'Jack', parent_permission: true, classroom: classroom)
    student.add_classroom(classroom)
    expect(student.classroom).to eq(classroom)
    expect(classroom.students).to include(student)
  end

  describe '#play_hooky' do
    it 'returns a string indicating that the student is playing hooky' do
      student = Student.new(40, 'Jack', parent_permission: true)
      play_hooky = '¯\\_(ツ)_/¯'
      expect(student.play_hooky).to eq(play_hooky)
    end
  end
end
