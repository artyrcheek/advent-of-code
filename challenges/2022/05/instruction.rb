class Instruction
  def self.from_line(line)
    new(line)
  end

  def initialize(line)
    @line = line
  end

  def amount
    # move 1 from 2 to 3 -> 1
    @line =~ /move (\d+) from/ ? $1.to_i : nil
  end

  def from
    # move 1 from 2 to 3 -> 2
    @line =~ /from (\d+) to/ ? $1.to_i : nil
  end

  def to
    # move 1 from 2 to 3 -> 3
    @line =~ /to (\d+)/ ? $1.to_i : nil
  end
end
