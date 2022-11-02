require_relative 'person'
require_relative 'decorator'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'

person = Person.new(22, 'maximilianus')
p person.correct_name # => maximilianus

capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name # => Maximilianus

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name # => Maximilian

# Codes to test Classroom functionality
student_a = Student.new('Science', 21, 'Peter')
student_b = Student.new('Art', 23, 'James')
student_c = Student.new('Science', 22, 'Mark')
student_d = Student.new('Art', 25, 'John')
science_class = Classroom.new('Science')
art_class = Classroom.new('Art')

print "\nBefore change\n"
p student_a.classroom, # => 'Science'
  student_b.classroom, # => 'Art'
  science_class.students.count, # => 0
  art_class.students.count # => 0

print "\nAfter change\n"
student_a.classroom = science_class # Reassign student_a to Science classroom
student_b.classroom = science_class # Reassign student_b to Science classroom
p student_a.classroom.label, # => 'Science'
  student_b.classroom.label, # => 'Science'
  science_class.students.count, # => 2
  art_class.students.count # => 0

print "\nStudents added to classes\n"
science_class.add_student(student_a) # Adds student_a to Science class without duplication
science_class.add_student(student_b) # Adds student_b to Science class without duplication
science_class.add_student(student_c) # Adds student_c to Science class
art_class.add_student(student_d) # Adds student_d to Art class without duplication
p student_b.classroom.label, # => 'Science'
  student_d.classroom.label, # => 'Art'
  science_class.students.count, # => 3
  art_class.students.count # => 1

# Codes to test Classroom functionality
print "\nBook Rentals\n"
physics_book = Book.new('Physical Properties & Forces', 'Praises Tula')
graphics_book = Book.new('Concept of Colors and Fonts', 'Jude Musa')
first_rental = Rental.new('2022-11-01', student_a, physics_book)
second_rental = Rental.new('2022-11-02', student_a, graphics_book)
third_rental = Rental.new('2022-11-01', student_d, graphics_book)

p first_rental.book.title, # => Physical Properties & Forces
  first_rental.book.author, # => Praises Tula
  first_rental.person.name, # => Peter
  second_rental.person.name, # => Peter
  third_rental.person.name, # => John
  third_rental.date # => 2022-11-01

p physics_book.rentals.count, # => 1
  graphics_book.rentals.count # => 2

p student_a.rentals.count, # => 2
  student_c.rentals.count, # => 0
  student_d.rentals.count # => 1
