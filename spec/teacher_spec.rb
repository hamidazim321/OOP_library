require_relative '../teacher'
describe Teacher do
  context 'When testing the Teacher class' do
    it 'Should always return true on can_use_services? method' do
      teacher = Teacher.new(22, 'CS', 'John')
      expect(teacher.can_use_services?).to be true
    end
  end
end
