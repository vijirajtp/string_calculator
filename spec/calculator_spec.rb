require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'returns the number itself for a single number' do
      expect(calculator.add("15")).to eq(15)
    end

    it 'ignores extra spaces' do
      expect(calculator.add(" 1 , 2 ,3 ,4, 5 ")).to eq(15)
    end

    it 'returns the sum of new line seperated numbers' do
      expect(calculator.add("1\n2\n3\n4\n")).to eq(10)
    end

    it 'returns the sum of comma and newline numbers' do
      expect(calculator.add("1\n2,3\n4")).to eq(10)
    end

    it 'raises an error for a single negative number' do
      expect { calculator.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed: -2")
    end

    it 'raises an error listing all negative numbers' do
      expect { calculator.add("-1,2,-3") }.to raise_error(ArgumentError, "negative numbers not allowed: -1, -3")
    end

    it 'supports custom delimiter ;' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'supports custom delimiter -' do
      expect(calculator.add("//-\n4-5")).to eq(9)
    end
  end
end
