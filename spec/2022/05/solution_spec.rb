# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day05 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/05/input.txt")) }
  let(:example_input) {
    <<~EOF
          [D]
      [N] [C]
      [Z] [M] [P]
       1   2   3

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    EOF
  }
  let(:parsed_crate) {
    CrateStackParser.new(example_input).parse
  }

  let(:parsed_instructions) {
    InstructionsParser.new(example_input).parse
  }

  describe "parsing crates" do
    it "can parse crates correctly" do
      expect(parsed_crate.columns).to eq([%w[Z N], %w[M C D], %w[P]])
    end
  end

  describe "parsing instructions" do
    it "parses the correct number of instructions" do
      expect(parsed_instructions.count).to eq(4)
    end

    it "parses the correct instructions" do
      instruction = parsed_instructions.first
      expect(instruction.amount).to eq(1)
      expect(instruction.from).to eq(2)
      expect(instruction.to).to eq(1)
    end
  end

  describe "moving" do
    it "can move crates correctly" do
      crane = CrateMover9000.new(parsed_crate)
      crane.move(1, from: 2, to: 1)
      expect(parsed_crate.columns).to eq([%w[Z N D], %w[M C], %w[P]])
      crane.move(3, from: 1, to: 3)
      expect(parsed_crate.columns).to eq([%w[], %w[M C], %w[P D N Z]])
      crane.move(2, from: 2, to: 1)
      expect(parsed_crate.columns).to eq([%w[C M], %w[], %w[P D N Z]])
      crane.move(1, from: 1, to: 2)
      expect(parsed_crate.columns).to eq([%w[C], %w[M], %w[P D N Z]])
    end
  end

  describe "part 1" do
    it "solves the example" do
      expect(RearragementProcedure.new(example_input).top_of_stacks).to eq("CMZ")
    end
  end

  describe "part 2" do
    it "solves the example with the crate_mover_9001" do
      expect(RearragementProcedure.new(example_input, with_crane: CrateMover9001).top_of_stacks).to eq("MCD")
    end
  end
end
