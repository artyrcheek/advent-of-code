class CellGrid

  def self.from_lines(lines)
    new(lines.map { |row| row.chars.map { |char| Cell.new(char) } })
  end

  def initialize(grid)
    @grid = grid
  end

  def find_start
    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        return [x, y] if cell.start?
      end
    end
    raise "No start found"
  end

  def [](x, y)
    return nil if x < 0 || y < 0
    @grid[y][x] # Right then down
  end

  def print
    puts "\n" + @grid.map(&:join).join("\n") + "\n"
  end

end
