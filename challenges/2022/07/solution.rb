# frozen_string_literal: true
module Year2022
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      tr = TerminalReader.new(data)
      tr.run
      subdirectories = tr.root_directory.all_subdirectories
      subdirectories.select{|sd| sd.size < 100_000}.sum(&:size)
    end

    def part_2
      nil
    end

  end
end
