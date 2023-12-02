# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2023::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2023/01/input.txt")) }
  let(:part_1_input) {
    <<~EOF
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    EOF
  }

  let(:part_2_input) {
    <<~EOF
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    EOF
}

let (:part_2_overlapping_input) {
  <<~EOF
    9fgsixzkbscvbxdsfive6spjfhzxbzvgbvrthreeoneightn

  EOF
}

  describe "part 1" do
    it "returns the correct answer for the example input" do
      expect(described_class.part_1(part_1_input)).to eq(142)
    end
  end

  describe "part 2" do
    it "returns the correct answer for the example input" do
      expect(described_class.part_2(part_2_input)).to eq(281)
    end

    it "can find overlapping words" do
      expect(described_class.part_2(part_2_overlapping_input)).to eq(98)
    end
  end
end
