require_relative '../calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end
  end
end
