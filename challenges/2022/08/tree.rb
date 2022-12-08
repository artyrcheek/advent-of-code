class Tree
  include Comparable
  attr_reader :height

  def initialize(height, tree_grid, column_index, row_index)
    @height = height.to_i
    @tree_grid = tree_grid
    @column_index = column_index
    @row_index = row_index
  end

  def visible?
    [
      visible_from?(above_column),
      visible_from?(left_of_row),
      visible_from?(right_of_row),
      visible_from?(below_column)
    ].any?
  end

  def scenic_score
    [
      visible_distance(above_column),
      visible_distance(left_of_row),
      visible_distance(below_column),
      visible_distance(right_of_row),
    ].reduce(&:*)
  end

  def <=>(other)
    height <=> other.height
  end

  def to_s
    height.to_s
  end

  def pretty_print(pp)
    pp.text to_s
  end

  private

  def visible_distance(neighbours)
    visible_neighbours = []
    neighbours.each do |neighbour|
      visible_neighbours << neighbour
      break if neighbour >= self
    end
    visible_neighbours.count
  end

  def visible_from?(neighbours)
    neighbours.empty? || self > neighbours.max
  end

  def right_of_row
    row_neighbours[@column_index + 1..-1]
  end

  def left_of_row
    row_neighbours[0...@column_index].reverse
  end

  def above_column
    column_neighbours[0...@row_index].reverse
  end

  def below_column
    column_neighbours[@row_index + 1..-1]
  end

  def row_neighbours
    @tree_grid.rows[@row_index]
  end

  def column_neighbours
    @tree_grid.columns[@column_index]
  end
end
