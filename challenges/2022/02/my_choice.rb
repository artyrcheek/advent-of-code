class MyChoice
  def calculate_my_outcome(opponent_choice, second_column)
    my_choice = my_choice_from(second_column)
    outcome = calculate_outcome(opponent_choice, my_choice)
    [outcome, my_choice]
  end

  def calculate_outcome(opponent_choice, my_choice)
    return  :draw if my_choice == opponent_choice
    return :win if my_choice == :rock && opponent_choice == :scissors
    return :win if my_choice == :paper && opponent_choice == :rock
    return :win if my_choice == :scissors && opponent_choice == :paper
    :loss
  end

  private

  def my_choice_from(letter)
    {
      "X": :rock,
      "Y": :paper,
      "Z": :scissors,
    }[letter.to_sym]
  end
end
