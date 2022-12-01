# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2021::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2021/01/input.txt")) }
  let(:example_input) {
    <<~EOF
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    EOF
  }

  describe "part 1" do
    it "returns nil for first measurement" do
      expect(sonar_sweeper.all_measurements[0]).to eq(nil)
    end

    it "returns increase for second measurement" do
      expect(sonar_sweeper.all_measurements[1]).to eq(:increase)
    end

    it "returns decrease for fifth measurement" do
      expect(sonar_sweeper.all_measurements[4]).to eq(:decrease)
    end

    it "returns ten measurements" do
      expect(sonar_sweeper.all_measurements.length).to eq(10)
    end

    it "returns 9 valid measurements" do
      expect(sonar_sweeper.all_measurements.compact.length).to eq(9)
    end

    it "returns 7 positive measurements" do
      expect(sonar_sweeper.positive_measurements.length).to eq(7)
    end

    it "returns 2 negative measurements" do
      expect(sonar_sweeper.negative_measurements.length).to eq(2)
    end
  end

  describe "part 2" do
    it "returns nil for first measurement" do
      expect(sonar_sample_sweeper.all_measurements[0]).to eq(nil)
    end

    it "returns 7 measurements" do
      expect(sonar_sample_sweeper.all_measurements.compact.length).to eq(7)
    end

    it "returns 5 positive measurements" do
      expect(sonar_sample_sweeper.positive_measurements.length).to eq(5)
    end

    it "returns 1 no change measurement" do
      expect(sonar_sample_sweeper.no_change_measurements.length).to eq(1)
    end

    it "returns 1 decrease measurement" do
      expect(sonar_sample_sweeper.negative_measurements.length).to eq(1)
    end


  end

  private

  def sonar_sample_sweeper
    SonarSweeper.new(chomped_example, sample_size: 3)
  end

  def sonar_sweeper
    SonarSweeper.new(chomped_example)
  end
end
