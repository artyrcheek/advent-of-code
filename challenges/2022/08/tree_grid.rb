class TreeGrid
  attr_accessor :grid

  def self.from_lines(lines)
    tree_grid = new
    grid = lines.map.with_index do |line, row_index|
      line.chars.map.with_index do |char, column_index|
        Tree.new(char.to_i, tree_grid, column_index, row_index)
      end
    end
    tree_grid.grid = grid
    tree_grid
  end

  def initialize( grid = [])
    @grid = grid
  end

  def visible_trees
    all_trees.count(&:visible?)
  end

  def highest_scenic_score
    all_trees.map(&:scenic_score).max
  end

  def all_trees
    rows.flatten
  end

  def rows
    @grid
  end

  def columns
    rows.transpose
  end


end
