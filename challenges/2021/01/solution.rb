# frozen_string_literal: true
module Year2021
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      SonarSweeper.new(data).positive_measurements.length
    end

    def part_2
      SonarSweeper.new(data, sample_size: 3).positive_measurements.length
    end

    private
    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.to_i
    end
  end
end
