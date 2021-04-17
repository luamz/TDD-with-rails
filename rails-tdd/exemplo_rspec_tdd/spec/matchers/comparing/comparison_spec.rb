describe 'Comparison Matchers' do
    it 'greater than' do
        expect(3).to be > 1
    end
    it 'greater or equal to' do
        expect(3).to be >= 1
        expect(3).to be >= 3

    end
    it 'less than' do
        expect(1).to be < 3
    end
    it 'less or equal to' do
        expect(1).to be <= 3
        expect(1).to be <= 1

    end

    it 'between inclusive' do
        expect(2).to be_between(1,3).inclusive
        expect(2).to be_between(2,3).inclusive

    end

    it 'between exclusive' do
        expect(2).to be_between(1,3).exclusive
    end

    it 'match' do
        expect('Hello@World').to match(/..@../)
    end

    it 'start with' do
        expect("Hello World").to start_with("Hello")
    end

    it 'end with' do
        expect("Hello World").to end_with("World")
    end

end