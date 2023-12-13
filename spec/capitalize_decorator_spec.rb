require_relative '../captitalize_decorator.rb'

describe CapitalizeDecorator do 
  context "Initialize CapitalizeDecorator" do
    it "Capitalizes the name" do
      person = double("Person")
      allow(person).to receive(:correct_name).and_return('maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq(person.correct_name.upcase)
    end
  end
end