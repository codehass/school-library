require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, _name = 'Unknown', _parent_permission: true)
    super(age, _name = 'Unknown', parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
