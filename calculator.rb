class Calculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = ','
    delimiter, number_string = extract_delimiter(numbers)

    sliced_numbers = number_string.split(/#{Regexp.escape(delimiter)}|\n/)
    parsed_numbers = parse_numbers(sliced_numbers)
    check_for_negatives(parsed_numbers)

    parsed_numbers.sum
  end

  private

  def extract_delimiter(numbers)
    if numbers.start_with?('//')
      header, number_string = numbers.split("\n", 2)
      delimiter = header[2..-1]
    else
      delimiter = ','
      number_string = numbers
    end
    [delimiter, number_string]
  end

  def parse_numbers(sliced_nums)
    sliced_nums.map { |num| num.strip.to_i }
  end

  def check_for_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
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
# puts calc.add("//;\n1;2")
# puts calc.add("//|\n5|8")
# puts calc.add("//-\n5-8")