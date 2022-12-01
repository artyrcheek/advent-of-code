class Food
  attr_reader :calories

  def initialize(calories)
    @calories = calories.to_i
  end
end
