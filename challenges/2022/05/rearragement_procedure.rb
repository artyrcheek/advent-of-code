class RearragementProcedure
  attr_reader :stacks

  def initialize(input)
    @crate_stack = CrateStackParser.new(input).parse
    @instructions = InstructionsParser.new(input).parse
  end

  def top_of_stacks
    @instructions.each do |instruction|
      @crate_stack.move(instruction.amount, from: instruction.from, to: instruction.to)
    end
    @crate_stack.columns.map(&:last).join
  end

end
