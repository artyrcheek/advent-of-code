class InstructionsParser
  def initialize(input)
    @input = input
  end

  def parse
    relevant_lines.map do |line|
      Instruction.from_line(line)
    end
  end

  def relevant_lines
    @input.split("\n").split("").last
  end
end
