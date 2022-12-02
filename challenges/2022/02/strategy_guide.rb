class StrategyGuide
  OPPONENT_LETTER_TO_RPS = {
    A: :rock,
    B: :paper,
    C: :scissors,
  }
  RPS_SCORING = {
    rock: 1,
    paper: 2,
    scissors: 3,
  }
  OUTCOME_SCORING = {
    win: 6,
    loss: 0,
    draw: 3,
  }

  GAME_REGEX = /(\w) (\w)/

  def initialize(strategy_guide, second_column:)
    @strategy_guide = strategy_guide
    @parser = second_column.new
  end

  def total_score
    @strategy_guide.map do |game|
      opponent_letter, second_column = $1, $2 if game =~ GAME_REGEX
      opponent_choice = OPPONENT_LETTER_TO_RPS[opponent_letter.to_sym]

      outcome, my_choice = @parser.calculate_my_outcome(opponent_choice, second_column)

      my_rps_score = RPS_SCORING[my_choice]
      outcome_score = OUTCOME_SCORING[outcome]

      my_rps_score + outcome_score
    end.sum
  end
end
