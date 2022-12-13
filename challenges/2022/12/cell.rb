class Cell
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def score
    @letter.ord - 'a'.ord
  end

  def start?
    @letter == 'S'
  end

   def to_s
    @letter
  end
end
