class Student < Person
  def initialize(age, classroom, _name = 'Unknown', _parent_permission: true)
    super(age, _name = 'Unknown', parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
