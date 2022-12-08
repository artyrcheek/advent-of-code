# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day08 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/08/input.txt")) }
  let(:example_input) {
    <<~EOF
      30373
      25512
      65332
      33549
      35390
    EOF
  }

  describe "part 1" do
    it "returns the correct number of visible trees" do
      expect(TreeGrid.new(chomped_example).visible_trees).to eq(21)
    end
  end

  describe "part 2" do
  end
end
