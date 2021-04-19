describe 'Predicate Matchers' do
    it 'is odd' do
        expect(1).to be_odd
    end

    it 'is even' do
        expect(2).not_to be_odd
    end
end