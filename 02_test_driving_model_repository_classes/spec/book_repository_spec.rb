require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end

  it 'prints out the list of books' do
    repo = BookRepository.new
    books = repo.all

    expect(books.length).to eq 5
    expect(books.first.id).to eq '1'
    expect(books.first.author_name).to eq 'George Orwell'
  end

end