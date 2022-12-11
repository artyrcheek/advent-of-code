# frozen_string_literal: true
module Year2022
  class Day11 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      tribe = Tribe.from_input(@input)
      20.times { tribe.run_round }
      tribe.monkey_business_score
    end

    def part_2
      tribe = Tribe.from_input(@input)
      10_000.times { tribe.run_round(worried: true) }
      tribe.monkey_business_score
    end
  end
end
