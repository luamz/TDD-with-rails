describe 'satisfy' do
    it {expect(2).to satisfy{|x| x%2}}
    it {
        expect(9).to satisfy('be a multple of 3') do |x| 
            x%3 == 0
        end
    }
end