class Coords
  attr_reader :x, :y, :history
  def initialize(x, y)
    @x = x
    @y = y
    @history = []
  end

  def to_a
    [@x, @y]
  end

  def move(vector)
    @x += vector[0]
    @y += vector[1]
    add_to_history
  end

  def move_towards(other)
    @x += 1 if @x < other.x
    @x -= 1 if @x > other.x
    @y += 1 if @y < other.y
    @y -= 1 if @y > other.y
    add_to_history
  end

  def is_touching?(other)
    (@x - other.x).abs <= 1 && (@y - other.y).abs <= 1
  end

  def add_to_history
    @history << [@x, @y] unless @history.include?([@x, @y])
  end
end
