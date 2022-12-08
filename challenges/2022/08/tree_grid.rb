class TreeGrid
  def initialize(grid)
    @grid = grid.map(&:chars).map{|row| row.map(&:to_i)}
  end

  def rows
    @grid
  end

  def columns
    rows.transpose
  end

  def visible_trees
    visible_trees = 0
    for row in (0...rows.length)
      for column in (0...columns.length)
        visible_trees += 1 if tree_is_visible?(row, column)
      end
    end
    visible_trees
  end

  private

  def tree_is_visible?(row_index, column_index)
    current_tree = rows[row_index][column_index]
    current_row = rows[row_index]
    current_column = columns[column_index]

    right_of_row = current_row[column_index + 1..-1]
    left_of_row = current_row[0...column_index].reverse
    above_column = current_column[0...row_index].reverse
    below_column = current_column[row_index + 1..-1]

    visible_from_left = left_of_row.empty? || current_tree > left_of_row.max
    visible_from_right = right_of_row.empty? || current_tree > right_of_row.max
    visible_from_above = above_column.empty? || current_tree > above_column.max
    visible_from_below = below_column.empty? || current_tree > below_column.max

    [visible_from_left, visible_from_right, visible_from_above, visible_from_below].any?
  end
end
