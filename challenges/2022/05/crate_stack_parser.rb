class CrateStackParser
  def initialize(input)
    @input = input
  end

  def parse
    CrateStack.new(columns)
  end

  private

  def columns
    has_more_columns, index, cols = true, 0, []
    while has_more_columns
      new_column = column_at_index(index)
      cols << new_column if new_column.any?
      has_more_columns = false if new_column.compact.empty?
      index += 1
    end
    cols
  end

  def relevant_lines
    @input.split("\n").split("").first
  end

  def column_at_index(index)
    relevant_lines.map do |line|
      # Turn [A] into A
      line[index*4..index*4 + 2] =~ /\[(\w)\]/ ? $1 : nil
    end.compact.reverse
  end
end
