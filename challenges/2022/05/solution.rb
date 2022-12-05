# frozen_string_literal: true
module Year2022
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      RearragementProcedure.new(@input).top_of_stacks
    end

    def part_2
      RearragementProcedure.new(@input, with_crane: CrateMover9001).top_of_stacks
    end
  end
end
