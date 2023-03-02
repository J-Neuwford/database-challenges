require_relative './book'

class BookRepository
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;
    sql = 'SELECT * FROM books;'
    result = DatabaseConnection.exec_params(sql, [])

    # Returns an array of Book objects.
    books = []

    result.each do |record|
      book = Book.new
      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']

      books << book
    end

    return books
  end
end