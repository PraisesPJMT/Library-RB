require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Dev', '22', 'Kwaleyela')
  end

  describe '#new' do
    it 'takes three parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  it 'should inherit behavior from Parent' do
    expect(Teacher.superclass).to eq(Person)
  end

  it 'should return the corret person' do
    expect(@teacher.name).to eq 'Kwaleyela'
  end

  it 'should return the corret specialization' do
    expect(@teacher.specialization).to eq 'Dev'
  end

  it 'should return the corret age' do
    expect(@teacher.age).to eq '22'
  end

  it 'returns use services' do
    expect(@teacher.can_use_services?).to eq true
  end
end
