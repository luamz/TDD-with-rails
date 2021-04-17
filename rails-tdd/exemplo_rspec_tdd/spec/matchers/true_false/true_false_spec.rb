describe 'Boolean Matchers' do
    it 'is true' do
        expect(1.odd?).to be true
    end

    it 'be truthy' do
        expect(1.odd?).to be_truthy
    end

    it 'is false' do
        expect(1.even?).to be false
    end
    
    it 'be falsey' do
        expect(1.even?).to be_falsey
    end

    it 'be nil' do
        expect(defined? x).to be_nil
    end
end