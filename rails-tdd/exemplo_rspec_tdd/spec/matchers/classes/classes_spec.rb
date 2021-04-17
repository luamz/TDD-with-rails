require 'not_empty_string'

describe 'Classes' do
    it 'be_instance_of' do
        expect(10).to be_instance_of(Integer) # This exact class
    end

    it 'be_kind_of' do
        str = NotEmptyString.new
        expect(str).to be_kind_of(String) # Includes inherited classes and their subclasses
        expect(str).to be_kind_of(NotEmptyString) 
    end

    it 'respond_to' do
        expect('Abba').to respond_to(:size)
        expect('Abba').to respond_to(:count)
    end

    it 'be_a/an' do
        str = NotEmptyString.new
        expect(str).to be_an(String)
        expect(str).to be_a(NotEmptyString)
    end

end