# frozen_string_literal: true
module Year2022
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      DatastreamBuffer.new(@input).start_of_packet_marker_index
    end

    def part_2
      DatastreamBuffer.new(@input).start_of_message_marker_index
    end

  end
end
