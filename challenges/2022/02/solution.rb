# frozen_string_literal: true
module Year2022
  class Day02 < Solution
    def part_1
      StrategyGuide.new(data, second_column: MyChoice).total_score
    end

    def part_2
      StrategyGuide.new(data, second_column: DesiredOutcome).total_score
    end
  end
end
