class Pairs < Array
  def self.from_section_assignments(section_assignments)
    pairs = section_assignments.map do |section_assignment_pair|
      Pair.from_section_assignment_pair(section_assignment_pair)
    end
    new(pairs)
  end

  def initialize(pairs)
    super(pairs)
  end

end
