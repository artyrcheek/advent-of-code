# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/03/input.txt")) }
  let(:example_input) {
    <<~EOF
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    EOF
  }
  let(:first_rucksack) { Rucksack.new(chomped_example.first) }
  let(:groups) { Group.from_input(chomped_example, size: 3) }

  describe "part 1" do
    it "can split a rucksack into compartments" do
      expect(first_rucksack.first_compartment).to eq("vJrwpWtwJgWr")
      expect(first_rucksack.second_compartment).to eq("hcsFMMfFFhFp")
    end

    it "can find an item in both compartments" do
      expect(first_rucksack.in_both).to eq("p")
    end

    it "can score a rucksack" do
      expect(first_rucksack.score).to eq(16)
    end

    it "returns the correct score for all rucksacks" do
      chomped_example.map { |rucksack| Rucksack.new(rucksack).score }.sum
    end
  end

  describe "part 2" do
    it "returns the correct common item for the first 3 rucksacks" do
      expect(groups.first.common_item).to eq("r")
    end

    it "returns the correct score for the first 3 rucksacks" do
      expect(groups.first.score).to eq(18)
    end

    it "splits the groups correctly" do
      expect(groups.length).to eq(2)
      expect(groups.first.rucksacks.length).to eq(3)
    end

    it "returns the correct score for all groups" do
      expect(groups.sum(&:score)).to eq(70)
    end
  end
end
