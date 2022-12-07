
class Directory
  attr_reader :path, :children, :subdirectories, :parent

  LINE_REGEX = /^dir (.*)/

  def self.from_line(line, parent = nil)
    return new($1, parent) if line =~ LINE_REGEX
    raise "Unknown directory format: #{line}"
  end

  def initialize(path, parent = nil)
    @path = path
    @parent = parent
    @files = []
    @subdirectories = []
  end

  def all_files
    @files + @subdirectories.flat_map(&:all_files)
  end

  def all_subdirectories
    @subdirectories + @subdirectories.flat_map(&:all_subdirectories)
  end

  def size
    all_files.sum(&:size)
  end

  def add_file(file)
    @files << file unless has_file?(file)
  end

  def find_subdirectory(path)
    @subdirectories.find { |subdirectory| subdirectory.path == path }
  end

  def add_subdirectory(directory)
    @subdirectories << directory unless has_subdirectory?(directory)
  end

  def children
    @files + @subdirectories
  end

  def full_path
    @parent ? @parent.full_path + "/" + @path : @path
  end

  def ==(other)
    path == other.path
  end

  def pretty_print(pp)
    pp.text "- #{full_path} (dir)"
    pp.nest(2) do
      children.each do |child|
        pp.breakable
        pp.pp child
      end
    end
  end

  private

  def has_file?(file)
    @files.any? { |existing_file| existing_file == file }
  end

  def has_subdirectory?(directory)
    @subdirectories.any? { |existing_subdirectory| existing_subdirectory == directory }
  end

end
