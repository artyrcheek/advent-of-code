# frozen_string_literal: true
module Year2022
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      tr = new_run
      subdirectories = tr.root_directory.all_subdirectories
      subdirectories.select{|sd| sd.size < 100_000}.sum(&:size)
    end

    def part_2
      tr = new_run
      file_system_size = 70_000_000
      unused_space_needed = 30_000_000

      used_space = tr.root_directory.size
      free_space = file_system_size - used_space

      space_needed = unused_space_needed - free_space

      subdirectories = tr.root_directory.all_subdirectories
      subdirectories.select{|sd| sd.size > space_needed}.min_by(&:size).size
    end

    def new_run
      tr = TerminalReader.new(data)
      tr.run
      tr
    end

  end
end
