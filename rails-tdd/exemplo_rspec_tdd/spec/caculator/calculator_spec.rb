require 'calculator'

describe Calculator do
    context 'sum for 2 numbers' do
        it 'with positive numbers' do
            calc = Calculator.new
            result = calc.sum(3,7)
            expect(result).to eq(10)
        end
        specify 'with negative numbers' do
            calc = Calculator.new
            result = calc.sum(-5,7)
            expect(result).to eq(2)
        end
    end
end