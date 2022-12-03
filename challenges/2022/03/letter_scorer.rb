class LetterScorer
  def initialize(letter)
    raise "Invalid letter" unless letter =~ /[a-zA-Z]/ && letter.length == 1
    @letter = letter
  end

  def score
    # Lowercase item types a through z have priorities 1 through 26.
    # Uppercase item types A through Z have priorities 27 through 52.
    # "A".ord - 38 = 27
    # "a".ord - 96 = 1

    # if the letter is uppercase
    uppercase? ? @letter.ord - 38 : @letter.ord - 96
  end

  private

  def uppercase?
    @letter == @letter.upcase
  end
end
