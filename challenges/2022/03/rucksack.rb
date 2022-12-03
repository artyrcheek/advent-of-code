class Rucksack
  def initialize(contents, letter_scorer: LetterScorer)
    @contents = contents # e.g. vJrwpWtwJgWrhcsFMMfFFhFp
    @letter_scorer = letter_scorer
  end

  def first_compartment
    # the first half of the contents
    @contents[0..(half_length - 1)]
  end

  def second_compartment
    # the second half of the contents
    @contents[(half_length)..-1]
  end

  def items
    @contents.chars
  end

  def in_both
    # the items that are in both compartments
    letter = (first_compartment.chars & second_compartment.chars).first
  end

  def score
    @letter_scorer.new(in_both).score
  end

  private

  def half_length
    @contents.length / 2
  end

end
