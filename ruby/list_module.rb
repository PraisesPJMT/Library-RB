# List class
module List
  # Method to list all persons (teachers, students)
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

  # Method to list all books in library
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

  # Method to list all rentals made
  def list_rentals
    if @rentals.length.positive?
      list_people
      puts "Enter the persons' ID to get list of rentals"
      print 'ID: '
      identity = gets.chomp.to_i
      rental_person = get_rentals(identity)
      rental_list = @rentals.select { |rental| rental.person.id == rental_person.id }
      if rental_list.empty?
        puts "#{rental_person.name} Person is yet to rent a book."
      else
        puts "List of books rented by #{rental_person.name} [#{rental_person.class}]"
        rental_list.each_with_index do |rental, index|
          puts "[#{index + 1}] Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    else
      puts 'No rent has been made yet. Please rent a book'
    end
  end
end

# HELPER METHODS
# -----Method to obtain all rentals made by a person
def get_rentals(identity)
  rental_person = @people.select { |person| person.id == identity }
  until rental_person.length.positive?
    list_people
    puts "Input ID is invalid. Please enter a persons' ID to get list of rentals"
    print 'ID: '
    identity = gets.chomp.to_i
    rental_person = @people.select { |person| person.id == identity }
  end
  rental_person[0]
end
