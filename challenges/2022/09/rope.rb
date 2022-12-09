DIRECTION_TO_VECTOR = {
  'R' => [1, 0],
  'L' => [-1, 0],
  'U' => [0, 1],
  'D' => [0, -1],
}.freeze

class Rope
  attr_reader :head, :tail

  def initialize(head: Coords.new(0, 0), tail: Coords.new(0, 0))
    @head = head
    @tail = tail
  end

  def read_instructions(instructions)
    instructions.each do |instruction|
      direction, amount = instruction.split(' ')
      move_head(direction, amount.to_i)
    end
  end

  def move_head(direction, amount)
    amount.times do
      @head.move(DIRECTION_TO_VECTOR[direction])
      move_tail if tail_needs_to_move?
    end
  end

  def move_tail
    @tail.move_towards(@head)
  end

  def tail_needs_to_move?
    !@head.is_touching?(@tail)
  end
end
