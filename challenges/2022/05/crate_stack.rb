class CrateStack
  attr_reader :columns

  def initialize(columns)
    @columns = columns
  end

  def move(amount, from:, to:)
    from_column = @columns[from - 1]
    to_column = @columns[to - 1]
    items_to_move = from_column.pop(amount).reverse
    to_column.push(*items_to_move)
  end

  def print
    @columns.each.with_index do |column, index|
      puts "#{index + 1} #{column.join("")}"
    end
  end
end
