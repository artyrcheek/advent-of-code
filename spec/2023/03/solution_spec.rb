# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2023::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2023/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..
    EOF
  end

  let(:oversearch_input) do
    <<~EOF
      *************
      *...........*
      *.123456789.*
      *...........*
      *************
    EOF
  end

  let(:diagnal_input) do
    <<~EOF
      ...........
      .123456789.
      ..........*
    EOF
  end

  let(:adjacent_number) do
    <<~EOF
      ...........
      .123456789.
      .....5.....
      .....*.....
    EOF
  end

  let(:symbol_sharing) do
    <<~EOF
      ...........
      .123456789.
      .....*.....
      .....5.....
    EOF
  end

  let(:symbol_on_last_line) do
    <<~EOF
      ........
      .24..4..
      ......*.
    EOF
  end

  describe 'part 1' do
    it 'returns correct answer for the example input' do
      expect(described_class.part_1(example_input)).to eq(4361)
    end

    it 'doesnt oversearch' do
      expect(described_class.part_1(oversearch_input)).to eq(0)
    end

    it 'can search diagnally' do
      expect(described_class.part_1(diagnal_input)).to eq(123_456_789)
    end

    it 'doesnt count adjacent numbers as symbols' do
      expect(described_class.part_1(adjacent_number)).to eq(5)
    end

    it 'can share symbols' do
      expect(described_class.part_1(symbol_sharing)).to eq(123_456_789 + 5)
    end

    it 'can find symbols on the last line' do
      expect(described_class.part_1(symbol_on_last_line)).to eq(4)
    end
  end

  describe 'part 2' do
    it 'returns correct answer for the example input' do
      expect(described_class.part_2(example_input)).to eq(467835)
    end
  end
end
