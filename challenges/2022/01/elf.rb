class Elf
  attr_accessor :food

  def initialize(food)
    @food = food
  end

  def total_calories
    food.map(&:calories).sum
  end
end
