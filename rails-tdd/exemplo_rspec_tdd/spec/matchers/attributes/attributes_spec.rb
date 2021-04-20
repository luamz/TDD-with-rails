require 'person'


describe 'Attributes' do

  around(:each) do |test|
    puts ">>>>>>> before"
    @person = Person.new
    test.run
    @person.name="Unknown"
    puts">>>>>>>> after #{@person.inspect}"

  end

  # before(:each) do
  #   puts ">>>>>>> before"
  #   @person = Person.new
  # end
  
  # after(:each) do
  #   @person.name="Unknown"
  #   puts">>>>>>>> after #{@person.inspect}"
  # end

  it 'have_attributes' do
    @person.name = "Luam"
    @person.age = 22
    expect(@person).to have_attributes(name: a_string_starting_with("L"), age: (a_value >= 20))
  end

  it 'have_attributes' do
    @person.name = "Luam"
    @person.age = 22
    expect(@person).to have_attributes(name: a_string_starting_with("L"), age: (a_value >= 20))
  end
end

