class Elves < Array
  def self.from_text(input)
    elves = input.split("").map do |food_calories|
      food = food_calories.map{|calories| Food.new(calories)}
      Elf.new(food)
    end
    new(elves)
  end

  def ordered
    sort_by(&:total_calories).reverse
  end

  def fattest(count = 1)
    return ordered.first if count == 1
    ordered.first(count)
  end
end
