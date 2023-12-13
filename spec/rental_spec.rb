require_relative '../rental'

describe Rental do
  before(:each) do
    # Create fake book and person
    @book = double('book')
    @person = double('person')

    # Stub the add_rental method on the book and person doubles
    allow(@book).to receive(:add_rental)
    allow(@person).to receive(:add_rental)

    # Create a Rental object
    @date = '2023-12-13'
    @rental = Rental.new(@date, @book, @person)
  end

  context 'When initialized' do
    it "Should run the add_rental method on Book and Person object given in parameter" do
      # Expect add_rental to be called on book and person with the rental object as a parameter
      expect(@book).to have_received(:add_rental).with(@rental)
      expect(@person).to have_received(:add_rental).with(@rental)
    end

    it "Should return the correct date, book, and person" do
      expect(@rental.date).to eq @date
      expect(@rental.book).to be @book
      expect(@rental.person).to be @person
    end
  end
end
