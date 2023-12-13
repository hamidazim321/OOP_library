require_relative '../book'

describe 'testing the book class' do
  it 'should initialize with title and author' do
    book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    expect(book.title).to eql 'The Great Gatsby'
    expect(book.author).to eql 'F. Scott Fitzgerald'
  end
end
