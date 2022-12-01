# frozen_string_literal: true
module Year2021
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      submarine = Submarine.new
      submarine.take_commands(data)
      submarine.multiplied_position
    end

    def part_2
      submarine = Submarine.new(commander: SubmarinePlanner::Aim)
      submarine.take_commands(data)
      submarine.multiplied_position
    end

  end
end
