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
  let(:tree_grid) { TreeGrid.from_lines(chomped_example) }

  describe "part 1" do
    it "returns the correct number of visible trees" do
      expect(tree_grid.visible_trees).to eq(21)
    end
  end

  describe "part 2" do
    it "returns the correct scenic score for the [1][2] tree" do
      one_two_tree = tree_grid.rows[1][2]
      expect(one_two_tree.scenic_score).to eq(4)
    end

    it "returns the correct scenic score for the [3][2] tree" do
      three_two_tree = tree_grid.rows[3][2]
      expect(three_two_tree.scenic_score).to eq(8)
    end

    it "returns the correct highest scenic score for a grid" do
      expect(tree_grid.highest_scenic_score).to eq(8)
    end
  end
end
