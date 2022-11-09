require_relative 'spec_helper'

describe Book do
  title = 'Introduction to Ruby'
  author = 'Praises Tula'
  context 'Book could be created' do
    it 'Created book created should be an instance of Book' do
      book = Book.new(title, author)
      expect(book).to be_an_instance_of Book
    end
  end

  context 'When title and author are used to create a book instance' do
    book = Book.new(title, author)
    it 'Book title should reflect title agument' do
      expect(book.title).to eq title
    end

    it 'Book author should reflect author agument' do
      expect(book.author).to eq author
    end
  end

  context 'When rentals are on a book' do
    book = Book.new(title, author)
    classroom = Classroom.new('Frontend')
    student = Student.new(classroom, 20, 'Maximilianus', true)
    teacher = Teacher.new('Backend', 25, 'Zeus')
    it 'Rentals count should be zero(0) on initialization' do
      expect(book.rentals.length).to eq 0
    end

    it 'Addition of rentals should be possible' do
      Rental.new('2022/09/07', student, book)
      expect(book.rentals.length).to eq 1
    end

    it 'Should permit addition multiple different rentals' do
      Rental.new('2022/10/01', teacher, book)
      Rental.new('2022/11/14', student, book)
      expect(book.rentals.length).to eq 3
    end
  end
end
