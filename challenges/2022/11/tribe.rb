class Tribe < Array
  ACTIVE_MONKEY_COUNT = 2
  INSPECTION_WORRY_FACTOR = 3

  def self.from_input(input)
    monkeys = input.split("\n\n").map do |monkey_input|
      Monkey.from_input(monkey_input)
    end
    new(monkeys)
  end

  def run_round(debug: false, worried: false)
    each do |monkey|
      puts "Monkey #{monkey.number}:" if debug
      until monkey.items.empty? do
        worry_level = monkey.inspect_item
        puts "  Monkey inspects an item with a worry level of #{worry_level}." if debug
        worry_level = monkey.operation.run(worry_level)
        puts "    Worry level is #{monkey.operation.operation} by #{monkey.operation.operand} to #{worry_level}." if debug
        worry_level /= INSPECTION_WORRY_FACTOR unless worried

        puts "    Monkey gets bored with item. Worry level is divided by 3 to #{worry_level}." if debug
        if monkey.worry_test.condition_met?(worry_level)
          puts "    Current worry level is #{monkey.worry_test.operation} by #{monkey.worry_test.operand}."
        else
          puts "    Current worry level is not #{monkey.worry_test.operation} by #{monkey.worry_test.operand}."
        end if debug

        pass_to_monkey_index = monkey.worry_test.run(worry_level)
        puts "    Item with worry level #{worry_level} is passed to monkey #{pass_to_monkey_index}." if debug
        pass_to_monkey = self[pass_to_monkey_index]
        pass_to_monkey.take_item(worry_level % least_common_multiple)
      end
    end
  end

  def monkey_business_score
    map(&:inspected_item_count).max(ACTIVE_MONKEY_COUNT).reduce(:*)
  end



  def least_common_multiple
    @least_common_multiple ||= calculate_least_common_multiple
  end

  def calculate_least_common_multiple
    operation_operands = map{ |monkey| monkey.operation.operand.to_i}
    worry_test_operands = map{ |monkey| monkey.worry_test.operand.to_i}
    operands = (operation_operands + worry_test_operands).filter(&:positive?)
    operands.reduce(&:lcm)
  end
end
