require_relative 'app'

def main
  puts 'Welcome to School Library App!'
  @exit = false
  library = Library.new
  until @exit
    library.display_menu
    main_response = gets.chomp
    until %w[1 2 3 4 5 6 7].include? main_response
      puts 'The option entered is not valid'
      library.display_menu
      main_response = gets.chomp
    end
    if main_response == '7'
      @exit = true
      puts 'Thanks for using the School Library'
      library.store_data
    end
    library.execute_command(main_response)
  end
end

main
