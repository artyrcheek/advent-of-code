class DesiredOutcome

  def calculate_my_outcome(opponent_choice, second_column)
    desired_outcome = desired_outcome_from(second_column)
    my_choice = make_choice_from_desired_outcome(opponent_choice, desired_outcome)
    [desired_outcome, my_choice]
  end

  private

  def make_choice_from_desired_outcome(opponent_choice, desired_outcome)
    return opponent_choice if desired_outcome == :draw
    return winning_choice_from(opponent_choice) if desired_outcome == :win
    return losing_choice_from(opponent_choice) if desired_outcome == :loss
  end

  def desired_outcome_from(letter)
    {
      "X": :loss,
      "Y": :draw,
      "Z": :win,
    }[letter.to_sym]
  end

  def winning_choice_from(opponent_choice)
    return :rock if opponent_choice == :scissors
    return :paper if opponent_choice == :rock
    return :scissors if opponent_choice == :paper
  end

  def losing_choice_from(opponent_choice)
    return :rock if opponent_choice == :paper
    return :paper if opponent_choice == :scissors
    return :scissors if opponent_choice == :rock
  end
end
