class DatastreamBuffer
  def initialize(input)
    @input = input
  end

  def start_of_packet_marker_index
    find_first_uniq_chars_index(amount: 4)&.+1
  end

  def start_of_message_marker_index
    find_first_uniq_chars_index(amount: 14)&.+1
  end

  private

  def find_first_uniq_chars_index(amount:)
    (0..@input.length).find { |i| uniq_chars_at?(i, chars: amount)}
  end

  def uniq_chars_at?(index, chars:)
    start = index - chars+1
    return false if start < 0
    @input[start..index].chars.uniq.length == chars
  end

end
