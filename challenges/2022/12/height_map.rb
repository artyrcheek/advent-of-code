class HeightMap
  SCORE_RANGE = 1

  def self.from_lines(lines)
    grid = CellGrid.from_lines(lines)
    new(grid)
  end

  def initialize(cell_grid)
    @cell_grid = cell_grid
    @cursor = cell_grid.find_start
    @visited = []
  end

  def print
    # Print the cell grid with X at the cursor
    @cell_grid.print
    puts "Cursor: #{@cursor}"
    puts "Visited: #{@visited}"

    move(available_directions.sample)
    sleep 0.1
    print
  end

  def available_directions
    [:left, :right, :up, :down].select do |direction|
      direction_cell = send(direction)
      direction_cell && allowed_scores.include?(direction_cell.score)
    end
  end

  def cursor_cell
    @cell_grid[*@cursor]
  end

  def move(direction)
    case direction
    when :left
      @cursor[0] -= 1
    when :right
      @cursor[0] += 1
    when :up
      @cursor[1] -= 1
    when :down
      @cursor[1] += 1
    end
    @visited << direction
  end

  private

  def allowed_scores
    return (-Float::INFINITY..Float::INFINITY) if cursor_cell.start?
    (cursor_cell.score-SCORE_RANGE)..(cursor_cell.score+SCORE_RANGE)
  end

  def left
    x, y = @cursor
    @cell_grid[x - 1, y]
  end

  def right
    x, y = @cursor
    @cell_grid[x + 1, y]
  end

  def up
    x, y = @cursor
    @cell_grid[x, y - 1]
  end

  def down
    x, y = @cursor
    @cell_grid[x, y + 1]
  end

end
