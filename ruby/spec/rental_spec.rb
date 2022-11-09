require_relative 'spec_helper'

describe Rental do
  before :each do
    @rentals = Rental.new('2020/02/02', Teacher.new('Math', 30), Book.new('Title', 'Author'))
  end

  describe '#new' do
    it 'takes three parameters and returns a Rental object' do
      expect(@rentals).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      expect(@rentals.date).to eql '2020/02/02'
    end
  end

  describe '#person' do
    it 'should return teacher object' do
      expect(@rentals.person).to be_an_instance_of Teacher
    end
  end

  describe '#person' do
    it 'should return book object' do
      expect(@rentals.book).to be_an_instance_of Book
    end
  end
end
