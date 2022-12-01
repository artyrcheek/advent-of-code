# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2021::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2021/02/input.txt")) }
  let(:example_input) {
    <<~EOF
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    EOF
  }

  describe "part 1" do
    it "returns the correct final position" do
      submarine = Submarine.new
      submarine.take_commands(chomped_example)
      expect(submarine.horizontal_position).to eq(15)
      expect(submarine.depth).to eq(10)
      expect(submarine.multiplied_position).to eq(150)
    end
  end

  describe "part 2" do
    it "returns the correct final position with aim" do
      submarine = Submarine.new(planner: SubmarinePlanner::Aim)
      submarine.take_commands(chomped_example)
      expect(submarine.horizontal_position).to eq(15)
      expect(submarine.depth).to eq(60)
      expect(submarine.multiplied_position).to eq(900)
    end
  end
end
