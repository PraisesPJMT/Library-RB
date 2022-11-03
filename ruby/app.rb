require_relative 'book'

class App
  def initialize
    @books = []
  end

  def list_books
    if @books.length.positive?
      puts 'List of books'
      @books.each_with_index do |book, index|
        puts "[#{index + 1}] #{book.title} by #{book.author}"
      end
    else
      puts 'No book has been added yet. Please create a book'
    end
  end
end
