class CrateStack
  attr_reader :columns

  def initialize(columns)
    @columns = columns
  end

  def print
    @columns.each.with_index do |column, index|
      puts "#{index + 1} #{column.join("")}"
    end
  end
end
