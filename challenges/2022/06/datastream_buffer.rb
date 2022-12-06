class DatastreamBuffer
  def initialize(input)
    @input = input
  end

  def start_of_packet_marker_index
    start_index = (0..@input.length).find { |i| uniq_chars_at?(i, chars: 4)}
    start_index + 1 if start_index
  end

  def start_of_message_marker_index
    start_index = (0..@input.length).find { |i| uniq_chars_at?(i, chars: 14)}
    start_index + 1 if start_index
  end

  private

  def uniq_chars_at?(index, chars:)
    start = index - chars+1
    return false if start < 0
    @input[start..index].chars.uniq.length == chars
  end

end
