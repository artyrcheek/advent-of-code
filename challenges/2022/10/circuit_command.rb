module CircuitCommand

  def self.from_line(line)
    case line
    when /noop/
      NoOp.new
    when /addx ([+-]?\d+)/
      Add.new($1.to_i)
    else
      raise "Unknown instruction: #{line}"
    end
  end

  class Base
    def cycle_time
      raise NotImplementedError
    end

    def execute(circuit)
      raise NotImplementedError
    end

    def run(circuit)
      circuit.add_cycles(cycle_time)
      execute(circuit)
    end
  end

  class NoOp < Base
    def cycle_time
      1
    end

    def execute(circuit)
      # do nothing
    end
  end

  class Add < Base
    def initialize(amount)
      @amount = amount
    end

    def cycle_time
      2
    end

    def execute(circuit)
      circuit.x += @amount
    end
  end
end
