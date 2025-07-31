class Calculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    # numbers.split(',').map(&:to_i).sum
    # numbers.split(',').map { |n| n.strip.to_i }.sum
    
    sliced_numbers = numbers.gsub("\n", ',').split(',')
    sliced_numbers.map do |number|
      stripped = number.strip.to_i
    end.sum
  end
end

calc = Calculator.new
puts calc.add("")
puts calc.add("1,2")
puts calc.add("1 , 2 ")
puts calc.add("1\n2,3")