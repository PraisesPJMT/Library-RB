require_relative 'book'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_people
    if @people.length.positive?
      puts 'List of people'
      @people.each_with_index do |person, index|
        puts "[#{index + 1}] - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'No person has been added yet. Please create a person'
    end
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
