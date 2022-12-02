# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/01/input.txt")) }
  let(:example_input) {
    <<~EOF
      A Y
      B X
      C Z
    EOF
  }

  describe "part 1" do

    it "can calculate the score when the second column is my choice" do
      expect(StrategyGuide.new(chomped_example, second_column: MyChoice).total_score).to eq(15)
    end
  end

  describe "part 2" do
    it "can calculate the score when the second column is the desired outcome" do
      expect(StrategyGuide.new(chomped_example, second_column: DesiredOutcome).total_score).to eq(12)
    end
  end
end
