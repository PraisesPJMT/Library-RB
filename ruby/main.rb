require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  @exit = false
  library = App.new
  until @exit
    display_menu
    main_response = gets.chomp
    until %w[1 2 3 4 5 6 7].include? main_response
      puts 'The option entered is not valid'
      display_menu
      main_response = gets.chomp
    end
    execute_command(library, main_response)
  end
end

def display_menu
  puts "Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit"
end

def execute_command(library, response)
  case response
  when '1'
    library.list_books
  when '2'
    library.list_people
  when '3'
    library.create_person
  when '4'
    library.create_book
  when '5'
    library.create_rental
  when '6'
    library.list_rentals
  else
    @exit = true
    puts 'Thanks for using the School Library'
  end
end

main
