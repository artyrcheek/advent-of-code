# frozen_string_literal: true
module Year2022
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      Pairs.from_section_assignments(data).select(&:overlap?).count
    end

    def part_2
      Pairs.from_section_assignments(data).select(&:overlap_at_all?).count
    end

  end
end
