DIRECTION_TO_VECTOR = {
  'R' => [1, 0],
  'L' => [-1, 0],
  'U' => [0, 1],
  'D' => [0, -1],
}.freeze

class Rope
  attr_reader :body

  def initialize(segments = 1)
    @body = (segments+1).times.map{ Coords.new(0,0)}
  end

  def head
    @body.first
  end

  def tail
    @body.last
  end

  def read_instructions(instructions)
    instructions.each do |instruction|
      direction, amount = instruction.split(' ')
      move_head(direction, amount.to_i)
    end
  end

  def move_head(direction, amount)
    amount.times do
      head.move(DIRECTION_TO_VECTOR[direction])
      current_segment = head
      body[1..-1].each do |segment|
        segment.move_towards(current_segment) unless segment.is_touching?(current_segment)
        current_segment = segment
      end
    end
  end

end
