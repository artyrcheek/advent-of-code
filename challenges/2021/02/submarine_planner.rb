module SubmarinePlanner
  class Base
    def initialize(submarine)
      @submarine = submarine
    end
  end

  class Normal < Base
    def down(distance)
      @submarine.depth += distance
    end

    def up(distance)
      @submarine.depth -= distance
    end

    def forward(distance)
      @submarine.horizontal_position += distance
    end
  end

  class Aim < Base
    def down(distance)
      @submarine.aim += distance
    end

    def up(distance)
      @submarine.aim -= distance
    end

    def forward(distance)
      @submarine.horizontal_position += distance
      @submarine.depth += @submarine.aim * distance
    end
  end

end
