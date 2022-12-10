# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day09 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/09/input.txt")) }
  let(:example_input) {
    <<~EOF
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    EOF
  }
  let(:example_input_2) {
    <<~EOF
      R 5
      U 8
      L 8
      D 3
      R 17
      D 10
      L 25
      U 20
    EOF
  }
  let(:rope) {Rope.new}
  let(:long_rope) {Rope.new(9)}

  describe "coords" do
    it "coords know when they are touching with 1 x offset" do
      touching = Coords.new(0, 0).is_touching?(Coords.new(1, 0))
      expect(touching).to be true
    end

    it "coords know when they are touching with 1y offset" do
      touching = Coords.new(0, 0).is_touching?(Coords.new(0, 1))
      expect(touching).to be true
    end

    it "coords know when they are touching with 1x and 1y offset" do
      touching = Coords.new(0, 0).is_touching?(Coords.new(1, 1))
      expect(touching).to be true
    end

    it "coords arent touching with 2x offset" do
      touching = Coords.new(0, 0).is_touching?(Coords.new(2, 0))
      expect(touching).to be false
    end
  end

  describe "rope" do
    it "the head finishes in the right place" do
      rope.read_instructions(chomped_example)
      expect(rope.head.to_a).to eq([2,2])
    end

    it "the tail finishes in the right place" do
      rope.read_instructions(chomped_example)
      expect(rope.tail.to_a).to eq([1,2])
    end
  end

  describe "part 1" do
    it "solves the example" do
      rope.read_instructions(chomped_example)
      expect(rope.tail.history.length).to eq(13)
    end
  end

  describe "part 2" do
    it "solves the example" do
      long_rope.read_instructions(example_input_2.lines(chomp: true))
      expect(long_rope.tail.history.length).to eq(36)
    end
  end
end
