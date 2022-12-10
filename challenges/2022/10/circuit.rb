CRT_WIDTH = 40
class Circuit
  attr_accessor :x, :signal_strengths
  attr_reader :cycles, :crt_lines
  def initialize
    @cycles = 0
    @x = 1
    @signal_strengths = {}
    @crt_lines = []
  end

  def execute_lines(lines)
    lines.each do |line|
      execute_line(line)
    end
  end

  def execute_line(line)
    instruction = CircuitCommand.from_line(line)
    instruction.run(self)
  end

  def print_crt
    puts
    @crt_lines.each do |line|
      puts line.join " "
    end
  end

  def sprite_position
    (@x-1)..(@x+1)
  end

  def draw_crt_line
    crt_row = (@cycles / CRT_WIDTH)
    crt_col = @cycles % CRT_WIDTH
    @crt_lines[crt_row] ||= Array.new(CRT_WIDTH, ".")
    @crt_lines[crt_row][crt_col] = sprite_position.include?(crt_col) ? "X" : "."
  end

  def add_cycles(cycles)
    cycles.times do
      draw_crt_line
      @cycles += 1
      add_signal_strength if should_add_signal_strength?
    end
  end

  def signal_strength
    @cycles * @x
  end

  private

  def add_signal_strength
    @signal_strengths[@cycles] = signal_strength
  end

  def should_add_signal_strength?
    # Every 40 with a 20 offset
    @cycles % 40 == 20
  end
end
