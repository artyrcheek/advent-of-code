class TerminalReader
  attr_reader :current_directory, :root_directory

  COMMAND_REGEX = /^\$/

  def initialize(lines)
    @lines = lines
    @root_directory = Directory.new("root")
    @current_directory = @root_directory
  end

  def run
    @lines.each do |line|
      case line
      when COMMAND_REGEX
        process_command(line)
      when FileItem::LINE_REGEX
        @current_directory.add_file(FileItem.from_line(line))
      when Directory::LINE_REGEX
        @current_directory.add_subdirectory(Directory.from_line(line, @current_directory))
      end
    end
  end

  def process_command(line)
    case line
    when /cd (.+)/
      change_directory($1)
    when /ls/
      # Do nothing
    else
      raise "Unknown command: #{line}"
    end
  end

  def change_directory(path)
    case path
    when '/'
      # Go to root
      @current_directory = @root_directory
    when '..'
      # Go up a directory
      parent = @current_directory.parent
      @current_directory = parent
    else
      go_to_subdirectory(path)
    end
  end

  def go_to_subdirectory(path)
    existing_subdirectory = @current_directory.find_subdirectory(path)
    unless existing_subdirectory
      subdirectory = Directory.new(path, @current_directory)
      @current_directory.add_subdirectory(subdirectory)
    end
    @current_directory = existing_subdirectory
  end
end
