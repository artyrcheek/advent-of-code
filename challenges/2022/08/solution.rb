# frozen_string_literal: true
module Year2022
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      TreeGrid.from_lines(data).visible_trees
    end

    def part_2
      TreeGrid.from_lines(data).highest_scenic_score
    end
  end
end
