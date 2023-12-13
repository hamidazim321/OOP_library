require_relative '../book'

describe 'testing the book class' do
  it 'should initialize with title and author' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.title).to eql 'The Great Gatsby'
    expect(book.author).to eql 'F. Scott Fitzgerald'
  end

  it "Should add rental a to the rental list on add_rental method" do
    fake_rental = {
      date: '12-23-22',
      book: 'Game Of Thrones'
    }
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')

    book.add_rental(fake_rental)

    expect(book.rentals).to include(fake_rental)
  end
end
