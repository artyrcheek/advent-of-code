class WorryTest
  attr_reader :operation, :operand, :true_monkey, :false_monkey

  def self.from_input(line)
    operation, operand = $1, $2 if line =~ /Test: (.*) (\d*)/
    true_monkey = $1.to_i if line =~ /If true: throw to monkey (\d*)/
    false_monkey = $1.to_i if line =~ /If false: throw to monkey (\d*)/
    new($1, $2, true_monkey: true_monkey, false_monkey: false_monkey) if line =~ /Test: (.*) (\d*)/
  end

  def initialize(operation, operand, true_monkey:, false_monkey:)
    @operation = operation
    @operand = operand.to_i
    @true_monkey = true_monkey
    @false_monkey = false_monkey
  end

  def run(number)
    condition_met?(number) ? @true_monkey : @false_monkey
  end

  def condition_met?(number)
    return number % @operand == 0 if @operation == "divisible by"
    raise "Unknown operation: #{@operation}"
  end
end
