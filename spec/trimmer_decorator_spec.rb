require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  context 'Initialize CapitalizeDecorator' do
    it 'Should return the first 10 letters of name if name length is greater than 10 letters' do
      person = double('Person')
      allow(person).to receive(:correct_name).and_return('maximilianus')
      trimmed_name = TrimmerDecorator.new(person).correct_name

      expect(trimmed_name).to eq(person.correct_name[0, 10])
    end
  end
end
