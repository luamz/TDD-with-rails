require 'person'


describe 'Attributes' do
#    before(:each) do
#      @person = Person.new
#    end

  let(:person){Person.new}

  it 'have_attributes' do
    person.name = "Luam"
    person.age = 22
    expect(person).to have_attributes(name: a_string_starting_with("L"), age: (a_value >= 20))
  end

  it 'have_attributes' do
    person.name = "Luam"
    person.age = 22
    expect(person).to have_attributes(name: a_string_starting_with("L"), age: (a_value >= 20))
  end
end

