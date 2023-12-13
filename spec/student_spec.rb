require_relative '../student'

describe 'testing student class' do
  it 'should generate both getters and setters' do
    student = Student.new(18)
    student.age = 20
    student.name = 'Jane Smith'
    student.parent_permission = false
    student.classroom = 'Science'

    expect(student.age).to eq 20
    expect(student.name).to eq 'Jane Smith'
    expect(student.parent_permission).to eq false
    expect(student.classroom).to eq 'Science'
  end
end
