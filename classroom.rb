require_relative 'student'
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(newstudent)
    @students.push(newstudent)
    newstudent.classroom = self
  end
end
