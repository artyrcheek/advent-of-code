# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2024::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2024/01/input.txt")) }
  let(:example_input) {
    <<~EOF
      change
      me
    EOF
  }

  describe "part 1" do
    it "returns nil for the example input" do
      expect(described_class.part_1(example_input)).to eq(nil)
    end

    it "returns nil for my input" do
      expect(described_class.part_1(input)).to eq(nil)
    end
  end

  describe "part 2" do
    it "returns nil for the example input" do
      expect(described_class.part_2(example_input)).to eq(nil)
    end

    it "returns nil for my input" do
      expect(described_class.part_2(input)).to eq(nil)
    end
  end
end
