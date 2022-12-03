# frozen_string_literal: true
module Year2022
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.map { |rucksack| Rucksack.new(rucksack).score }.sum
    end

    def part_2
      Group.from_input(data, size: 3).sum(&:score)
    end

  end
end
