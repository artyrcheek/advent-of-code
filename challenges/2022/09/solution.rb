# frozen_string_literal: true
module Year2022
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      rope = Rope.new
      rope.read_instructions(data)
      rope.tail.history.length
    end

    def part_2
      rope = Rope.new(9)
      rope.read_instructions(data)
      rope.tail.history.length
    end

  end
end
