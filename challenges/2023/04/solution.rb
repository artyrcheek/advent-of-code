# frozen_string_literal: true
module Year2023
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      worths = data.map { |card| ScratchCard.parse(card).worth }
      worths.sum
    end

    def part_2
      nil
    end

    class ScratchCard
      # Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
      LINE_REGEX = /Card.*\d+: (?<numbers>.*) \| (?<numbers_to_match>.*)/
      def self.parse(line)
        match = line.match(LINE_REGEX)
        numbers = match[:numbers].split.map(&:to_i)
        numbers_to_match = match[:numbers_to_match].split.map(&:to_i)
        new(numbers, numbers_to_match)
      end

      def initialize(numbers, numbers_to_match)
        @numbers = numbers
        @numbers_to_match = numbers_to_match
      end

      def winning_numbers
        @numbers_to_match.select { |number| @numbers.include?(number) }
      end

      def worth
        return 0 if winning_numbers.empty?
        2 ** (winning_numbers.size - 1)
      end
    end
  end
end
