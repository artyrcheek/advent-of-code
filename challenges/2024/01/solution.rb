# frozen_string_literal: true
module Year2024
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      numbers = data.map { |line| line.split(" ").map(&:strip).map(&:to_i) }
      left_numbers = numbers.map(&:first).sort
      right_numbers = numbers.map(&:last).sort

      left_numbers.map.with_index do |left, index|
        (left - right_numbers[index]).abs
      end.sum
    end

    def part_2
      numbers = data.map { |line| line.split(" ").map(&:strip).map(&:to_i) }
      left_numbers = numbers.map(&:first)

      left_numbers.map.with_index do |left|
        right_list_count = numbers.map(&:last).count(left)
        left * right_list_count
      end.sum
    end

    private

      # Processes each line of the input file and stores the result in the dataset
      # def process_input(line)
      #   line.map(&:to_i)
      # end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
