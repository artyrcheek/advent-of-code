class Group
  attr_reader :rucksacks

  def self.from_input(input, size:)
    # Split the input into groups of 3
    input.each_slice(size).map { |rucksacks| new(rucksacks) }
  end

  def initialize(rucksacks, letter_scorer: LetterScorer)
    @rucksacks = rucksacks.map { |rucksack| Rucksack.new(rucksack) }
    @letter_scorer = letter_scorer
  end

  def common_item
    @rucksacks.map(&:items).inject(:&).first
  end

  def score
    @letter_scorer.new(common_item).score
  end
end
