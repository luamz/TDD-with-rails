require 'person'

describe 'Attributes' do
   it 'have_attributes' do
     person = Person.new
     person.name = "Luam"
     person.age = 22

     expect(person).to have_attributes(name: a_string_starting_with("L"), age: (a_value >= 20))
   end
end