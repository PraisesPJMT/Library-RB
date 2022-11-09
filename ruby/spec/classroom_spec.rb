require_relative 'spec_helper'

describe Classroom do
  class_name = 'Frontend'
  context 'Classroom should be created' do
    classroom = Classroom.new(class_name)
    it 'Created classroom should be an instance of the Classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end
  end

  context 'When passed in a classname' do
    classroom = Classroom.new(class_name)
    it 'Label should match the argument' do
      expect(classroom.label).to eq class_name
    end
  end

  context 'When students are added to the classroom' do
    classroom = Classroom.new(class_name)
    student1 = Student.new(classroom, 25, 'Maximilianus', true)
    student2 = Student.new(classroom, 13, 'Zeus', false)
    student3 = Student.new(classroom, 19, 'Poseidon', true)
    it 'Student count should be zero(0) on initialization' do
      expect(classroom.students.length).to eq 0
    end

    it 'Addition of student should be possible' do
      classroom.add_student(student1)
      expect(classroom.students.length).to eq 1
    end

    it 'Should not permit duplicate addition' do
      classroom.add_student(student1)
      expect(classroom.students.length).to eq 1
    end

    it 'Should permit addition multiple different students' do
      classroom.add_student(student2)
      classroom.add_student(student3)
      expect(classroom.students.length).to eq 3
    end
  end
end
