require_relative 'person'

class Student < Person
  def initialize(id, age, name = 'unknown', parent_permission = true, classroom)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
