# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2023::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2023/02/input.txt")) }
  let(:example_input) {
    <<~EOF
      Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
      Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
      Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
      Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
      Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    EOF
  }

  describe "part 1" do
    it "returns correct answer for the example input" do
      expect(described_class.part_1(example_input)).to eq(8)
    end
  end

  describe "part 2" do
    it "returns the correct answer for the example input" do
      expect(described_class.part_2(example_input)).to eq(2286)
    end
  end
end
