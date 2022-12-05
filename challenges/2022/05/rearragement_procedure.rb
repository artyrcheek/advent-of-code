class RearragementProcedure
  attr_reader :stacks

  def initialize(input, with_crane: CrateMover9000)
    @crate_stack = CrateStackParser.new(input).parse
    @instructions = InstructionsParser.new(input).parse
    @crane = with_crane.new(@crate_stack)
  end

  def top_of_stacks(with_crane: CrateMover9000)
    @instructions.each do |instruction|
      # @crate_stack.move(instruction.amount, from: instruction.from, to: instruction.to)
      @crane.move(instruction.amount, from: instruction.from, to: instruction.to)
    end
    @crate_stack.columns.map(&:last).join
  end

end
