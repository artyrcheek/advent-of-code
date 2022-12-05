class Crane
  attr_reader :columns

  def initialize(crate_stack)
    @columns = crate_stack.columns
  end

  def move(amount, from:, to:)
    items_to_move = pick_up_items(from_column(from), amount)
    drop_items(to_column(to), items_to_move)
  end

  private

  def from_column(from)
    @columns[from - 1]
  end

  def to_column(to)
    @columns[to - 1]
  end

  def pick_up_items(from_column, amount)
    from_column.pop(amount).reverse
  end

  def drop_items(to_column, items)
    to_column.push(*items)
  end


end
