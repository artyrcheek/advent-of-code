# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/01/input.txt")) }
  let(:example_input) {
    <<~EOF
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    EOF
  }

  def elves
    Elves.from_text(chomped_example)
  end

  describe "part 1" do
    it "can split input into elves" do
      expect(elves.length).to eq(5)
    end

    it "can sum an elves calories" do
      expect(elves[0].total_calories).to eq(6000)
      expect(elves[1].total_calories).to eq(4000)
      expect(elves[2].total_calories).to eq(11000)
      expect(elves[3].total_calories).to eq(24000)
      expect(elves[4].total_calories).to eq(10000)
    end

    it "can find the fattest elf" do
      expect(elves.fattest.total_calories).to eq(24000)
    end
  end

  describe "part 2" do
    it "can find the fattest x elves" do
      expect(elves.fattest(3).sum(&:total_calories)).to eq(45000)
    end
  end
end
