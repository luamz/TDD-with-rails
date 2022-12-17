describe "Equality Matchers" do
    it '#equal' do #Same object?
        x = "ruby"
        y = "ruby"
        expect(x).not_to equal(y)   
        expect(x).to equal(x)  
    end
    it '#be' do #Same object?
        x = "ruby"
        y = "ruby"
        expect(x).not_to be(y)   
        expect(x).to be(x)  
    end
    it '#eql/eq' do #Same value?
        x = "ruby"
        y = "ruby"
        expect(x).to eq(y) 
    end

end