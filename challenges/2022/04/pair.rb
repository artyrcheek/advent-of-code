class Pair
  def self.from_section_assignment_pair(section_assignment_pair)
    if section_assignment_pair =~ /(\d+)-(\d+),(\d+)-(\d+)/
      new($1.to_i..$2.to_i, $3.to_i..$4.to_i)
    end
  end

  def initialize(section_1, section_2)
    @a = section_1
    @b = section_2
  end

  def overlap?
    @a.cover?(@b) || @b.cover?(@a)
  end

  def overlap_at_all?
    (@a.to_a & @b.to_a).any?
  end

  def to_s
    "#{@a.first}-#{@a.last},#{@b.first}-#{@b.last}"
  end
end

