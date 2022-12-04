# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/04/input.txt")) }
  let(:example_input) {
    <<~EOF
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    EOF
  }

  let(:pairs) {
    Pairs.from_section_assignments(chomped_example)
  }

  describe "part 1" do
    it "splits the input into pairs" do
      expect(pairs.count).to eq(6)
    end

    it "it returns the correct number of pairs where one range fully contains the other" do
      expect(pairs.select(&:overlap?).count).to eq(2)
    end
  end

  describe "part 2" do
    it "it returns the correct number of pairs where one range partly overlaps" do
      expect(pairs.select(&:overlap_at_all?).count).to eq(4)
    end
  end
end
