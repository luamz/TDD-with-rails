require 'person'

shared_examples 'status' do |feeling|
  it "#{feeling}" do
    person.send("#{feeling}!")
    expect(person.status).to eq("Feeling #{feeling.capitalize}!")
  end
end

describe 'Person' do
  subject(:person) {Person.new}

  it_behaves_like 'status', :happy
  it_behaves_like 'status', :sad
  it_behaves_like 'status', :anxious

end