require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new('Math', '18', 'Mathew', true)
  end

  describe '#new' do
    it 'takes three parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe '#classroom' do
    it 'returns the correct classroom' do
      expect(@student.classroom).to eql 'Math'
    end
  end

  it 'should inherit behavior from Parent' do
    expect(Student.superclass).to eq(Person)
  end

  it 'returns play hookey' do
    expect(@student.play_hooky).to eql '¯\\(ツ)/¯'
  end
end
