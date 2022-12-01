class Submarine
  attr_accessor :horizontal_position, :depth, :aim
  COMMAND_REGEX = /(forward|down|up).*(\d)/i

  def initialize(planner: SubmarinePlanner::Normal)
    @depth = 0
    @horizontal_position = 0
    @aim = 0
    @planner = planner.new(self)
  end

  def multiplied_position
    horizontal_position * depth
  end

  def take_commands(commands)
    commands.each do |command|
      command(command)
    end
  end

  def command(command)
    if command =~ COMMAND_REGEX
      case $1
        when "forward" then @planner.forward($2.to_i)
        when "down" then @planner.down($2.to_i)
        when "up" then @planner.up($2.to_i)
      end
    end
  end
end
