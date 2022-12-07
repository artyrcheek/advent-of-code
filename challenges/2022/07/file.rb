class File
  LINE_REGEX = /^(\d+)\s+(.*)$/
  attr_reader :name, :size

  def self.from_line(line)
    return new($2, $1.to_i) if line =~ LINE_REGEX
    raise "Unknown file format: #{line}"
  end

  def initialize(name, size)
    @name = name
    @size = size
  end

  def ==(other)
    name == other.name
  end

  def pretty_print(pp)
    pp.text "- #{name} (file, size=#{size})"
  end
end
