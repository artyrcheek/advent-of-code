class Operation
  attr_reader :operation, :operand
  def self.from_input(line)
    new($1, $2) if line =~ /new = old (.?) (.+)/
  end

  def initialize(operation, operand)
    @operation = operation
    @operand = operand
  end

  def run(number)
    operand = @operand == "old" ? number.to_i : @operand.to_i
    return number * operand if @operation == "*"
    return number + operand if @operation == "+"
    raise "Unknown operation: #{@operation}"
  end
end
