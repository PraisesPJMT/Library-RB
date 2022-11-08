require_relative 'list_module'
require_relative 'create_module'

class Library
  include List
  include Create

  def initialize
    @books = []
    @people = []
    @rentals = []
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

  def execute_command(response)
    case response
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    end
  end
end
