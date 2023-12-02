# frozen_string_literal: true
module Year2023
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |line|
        DigitCalibrationValue.new(line).first_and_last_digits
      end
    end

    def part_2
      data.sum do |line|

        WordCalibrationValue.new(line).first_and_last_digits
      end
    end

    private

    class CalibrationValue
      def initialize(line)
        @line = line
      end

      def digits
        raise NotImplementedError
      end

      def first_and_last_digits
        "#{digits.first}#{digits.last}".to_i # add first and last digits
      end
    end

    class DigitCalibrationValue < CalibrationValue
      def digits
        @line.gsub(/\D/, '').chars.compact # remove non-digits
      end
    end

    class WordCalibrationValue < CalibrationValue
      NUMBER_WORDS = %w[one two three four five six seven eight nine]
      VALID_DIGIT_REGEX = /(?=(#{NUMBER_WORDS.join('|')}|\d))/

      def digits
        # turn 4nineeightseven2 into [9, 8, 7]
        @line.scan(VALID_DIGIT_REGEX).compact.map do |word|
          word = word.first # scan returns an array of arrays
          word =~ /\d/ ? word : NUMBER_WORDS.find_index(word) + 1
        end
      end
    end
  end
end
