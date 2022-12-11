class Monkey
  attr_reader :number, :operation, :worry_test
  attr_accessor :items

  def self.from_input(input)
    MonkeyParser.new(input).monkey
  end

  def initialize(number, starting_items:, operation:, worry_test:)
    @number = number
    @items = starting_items
    @operation = operation
    @worry_test = worry_test
    @inspected_items = []
  end

  def inspect_item
    item = @items.shift
    @inspected_items << item
    item
  end

  def inspected_item_count
    @inspected_items.count
  end

  def take_item(worry_level)
    @items << worry_level
  end
end
