# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day12 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/12/input.txt")) }
  let(:example_input) {
    <<~EOF
      Sabqponm
      abcryxxl
      accszExk
      acctuvwj
      abdefghi
    EOF
  }
  let(:height_map) { HeightMap.from_lines(chomped_example) }

  describe "parsing" do
    it "parses the example input" do
      height_map.print
    end
  end

  describe "part 1" do
  end

  describe "part 2" do
  end
end
