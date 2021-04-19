require 'calculator'

RSpec.describe Calculator, 'with simple operations' do
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
    context '#division' do
        it 'divided by zero' do
            expect{subject.divide(3, 0)}.to raise_error(ZeroDivisionError, "divided by 0")
        end
    end
end