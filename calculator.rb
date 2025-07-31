class Calculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    # numbers.split(',').map(&:to_i).sum
    # numbers.split(',').map { |n| n.strip.to_i }.sum
    
    sliced_numbers = numbers.gsub("\n", ',').split(',')
    parsed_numbers = sliced_numbers.map do |number|
      stripped = number.strip.to_i
    end

    negatives = parsed_numbers.select { |n| n < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    parsed_numbers.sum
  end
end

## Below examples to run and see the output

# calc = Calculator.new
# puts calc.add("")
# puts calc.add("1,2")
# puts calc.add("1 , 2 ")
# puts calc.add("1\n2,3")
# puts calc.add("1,2,-3")
# puts calc.add("-1,2,-3")