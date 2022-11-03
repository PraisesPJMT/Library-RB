require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'

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
end

# Helper methods

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
