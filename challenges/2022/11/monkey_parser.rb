class MonkeyParser
  def initialize(input)
    @input = input
  end

  def monkey
    Monkey.new(
      monkey_number,
      starting_items: starting_items,
      operation: operation,
      worry_test: worry_test,
    )
  end

  private

  def monkey_number
    return $1.to_i if @input =~ /Monkey (\d+):/
    raise "Could not parse monkey number"
  end

  def starting_items
    return $1.split(", ").map(&:to_i) if @input =~ /Starting items: (.*)/
    raise "Could not parse starting items"
  end

  def operation
    return Operation.from_input($1) if @input =~ /Operation: (.*)/
    raise "Could not parse operation"
  end

  def worry_test
    return WorryTest.from_input(@input) if @input =~ /Test: (.*)/
    raise "Could not parse test"
  end
end
