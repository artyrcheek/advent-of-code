# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day10 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/10/input.txt")) }
  let(:small_example) {
    <<~EOF
      noop
      addx 3
      addx -5
    EOF
    .lines(chomp: true)
  }
  let(:large_example) {
    <<~EOF
      addx 15
      addx -11
      addx 6
      addx -3
      addx 5
      addx -1
      addx -8
      addx 13
      addx 4
      noop
      addx -1
      addx 5
      addx -1
      addx 5
      addx -1
      addx 5
      addx -1
      addx 5
      addx -1
      addx -35
      addx 1
      addx 24
      addx -19
      addx 1
      addx 16
      addx -11
      noop
      noop
      addx 21
      addx -15
      noop
      noop
      addx -3
      addx 9
      addx 1
      addx -3
      addx 8
      addx 1
      addx 5
      noop
      noop
      noop
      noop
      noop
      addx -36
      noop
      addx 1
      addx 7
      noop
      noop
      noop
      addx 2
      addx 6
      noop
      noop
      noop
      noop
      noop
      addx 1
      noop
      noop
      addx 7
      addx 1
      noop
      addx -13
      addx 13
      addx 7
      noop
      addx 1
      addx -33
      noop
      noop
      noop
      addx 2
      noop
      noop
      noop
      addx 8
      noop
      addx -1
      addx 2
      addx 1
      noop
      addx 17
      addx -9
      addx 1
      addx 1
      addx -3
      addx 11
      noop
      noop
      addx 1
      noop
      addx 1
      noop
      noop
      addx -13
      addx -19
      addx 1
      addx 3
      addx 26
      addx -30
      addx 12
      addx -1
      addx 3
      addx 1
      noop
      noop
      noop
      addx -9
      addx 18
      addx 1
      addx 2
      noop
      noop
      addx 9
      noop
      noop
      noop
      addx -1
      addx 2
      addx -37
      addx 1
      addx 3
      noop
      addx 15
      addx -21
      addx 22
      addx -6
      addx 1
      noop
      addx 2
      addx 1
      noop
      addx -10
      noop
      noop
      addx 20
      addx 1
      addx 2
      addx 2
      addx -6
      addx -11
      noop
      noop
      noop
    EOF
    .lines(chomp: true)
  }

  describe "part 1" do
    it "returns the correct x value for the small example" do
      circuit = Circuit.new
      circuit.execute_lines(small_example)
      expect(circuit.x).to eq(-1)
    end

    it "returns the correct signal strengths for the large example" do
      circuit = Circuit.new
      circuit.execute_lines(large_example)
      expect(circuit.signal_strengths.values).to eq([420, 1140, 1800, 2940, 2880, 3960])
      expect(circuit.signal_strengths.values.sum).to eq(13140)
    end

    it "can print the crt lines" do
      circuit = Circuit.new
      circuit.execute_lines(large_example)
      circuit.print_crt
    end
  end

end
