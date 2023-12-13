require_relative '../classroom'

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

describe Classroom do
  before(:each) do
    # Create fake student
    @student = double('student')

    # Stub the classroom method on student
    allow(@student).to receive(:classroom=)

    @label = 'test label'
    @classroom = Classroom.new(@label)
  end

  context "When initialized" do
    it "Should add student to list of students" do
      @classroom.add_student(@student)
      student_list = @classroom.students

      expect(student_list).to include(@student)
    end

    it "Should run the classroom method on the given student in add_student method" do
      @classroom.add_student(@student)
      expect(@student).to have_received(:classroom=).with(@classroom)
    end
  end
end
