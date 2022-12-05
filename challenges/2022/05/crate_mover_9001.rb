class CrateMover9001 < Crane
  def pick_up_items(from_column, amount)
    from_column.pop(amount)
  end
end
