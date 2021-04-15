require 'calculator'

describe Calculator, 'with simple operations' do
    context '#sum' do
        it 'with positive numbers' do
            result = subject.sum(3,7)
            expect(result).to eq(10)
        end

        it 'with negative numbers' do
            result = subject.sum(-5,-7)
            expect(result).to eq(-12)
        end

        it 'with integers' do
            result = subject.sum(-5,7)
            expect(result).to eq(2)
        end
    end
end