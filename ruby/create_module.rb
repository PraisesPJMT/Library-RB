require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'

# Module to create a new student, teacher, book and rentals
module Create
  # Module to create a student
  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    until age.to_i.positive?
      puts "Please students' age should be a number"
      print 'Age: '
      age = gets.chomp
    end
    print 'Classroom: '
    classroom_input = gets.chomp
    classroom = Classroom.new(classroom_input)
    permission = obtain_permission
    new_student = Student.new(classroom, age, name, permission)
    @people << new_student
    puts "New Student (#{new_student.name.capitalize}) was created successful"
  end

  # Module to create a teacher
  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    until age.to_i.positive?
      puts "Please teachers' age should be a number"
      print 'Age: '
      age = gets.chomp
    end
    print 'Specialization: '
    spec = gets.chomp
    new_teacher = Teacher.new(spec, age, name)
    @people << new_teacher
    puts "New Teacher (#{new_teacher.name.capitalize}) was created successful"
  end

  # Module to create a person (teacher or student)
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    print '[Input the number]: '
    person_response = gets.chomp
    until %w[1 2].include?(person_response)
      puts 'Please input (1) to create a student or input (2) to create a teacher'
      print '[Input the number]: '
      person_response = gets.chomp
    end
    case person_response
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book
    puts 'Please enter the following details to create a book'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts "#{new_book.title} book by #{new_book.author} was added successful"
  end

  # Module to create a rental
  def create_rental
    if @people.length.positive? && @books.length.positive?
      generate_rental
    elsif @people.length.positive?
      puts 'No book has been created yet. Please create a book to rent'
    elsif @books.length.positive?
      puts 'No person has been created yet. Please create a person to rent a book'
    else
      puts 'Please create both a person and a book to create a rent'
    end
  end
end

# HELPER METHODS
# -----Method to obtain student permission status
def obtain_permission
  permission = true
  print 'Has parent permission? [Y/N]]: '
  parent_permission = gets.chomp
  until %w[yes y n no].include? parent_permission.downcase
    puts 'Parent permission input must be either Y, Yes, N, or No'
    print 'Has parent permission? [Y/N]]: '
    parent_permission = gets.chomp
  end
  case parent_permission.downcase
  when 'y', 'yes'
    permission = true
  when 'n', 'no'
    permission = false
  end
  permission
end

# -----Method to ensure users make selection only from list of books available
def verify_book(book_input)
  book = book_input
  until book.positive? && book <= @books.length
    puts 'INVALID SELECTION! Please only select a book from the following list by number'
    list_books
    print 'Book: '
    book = gets.chomp.to_i
  end
  book - 1
end

# -----Method to ensure users make selection only from list of persons available
def verify_person(person_input)
  person = person_input
  until person.positive? && person <= @people.length
    puts 'INVALID SELECTION! Please only select a person from the following list by number'
    list_people
    print 'Person: '
    person = gets.chomp.to_i
  end
  person - 1
end

# -----Method to help users select books and person for rental generation
def generate_rental
  puts 'Select a book from the following list by number'
  list_books
  print 'Book: '
  book_input = gets.chomp.to_i
  book = @books[verify_book(book_input)]
  puts 'Select a person from the following list by number (not ID)'
  list_people
  print 'Person: '
  person_input = gets.chomp.to_i
  person = @people[verify_person(person_input)]
  puts 'Enter date in this format [yyyy/mm/dd]'
  print 'Date: '
  date = gets.chomp
  new_rental = Rental.new(date, person, book)
  @rentals << new_rental
  puts "#{book.title} book was rented successful"
end
