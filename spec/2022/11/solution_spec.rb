# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day11 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/11/input.txt")) }
  let(:example_input) {
    <<~EOF
      Monkey 0:
        Starting items: 79, 98
        Operation: new = old * 19
        Test: divisible by 23
          If true: throw to monkey 2
          If false: throw to monkey 3

      Monkey 1:
        Starting items: 54, 65, 75, 74
        Operation: new = old + 6
        Test: divisible by 19
          If true: throw to monkey 2
          If false: throw to monkey 0

      Monkey 2:
        Starting items: 79, 60, 97
        Operation: new = old * old
        Test: divisible by 13
          If true: throw to monkey 1
          If false: throw to monkey 3

      Monkey 3:
        Starting items: 74
        Operation: new = old + 3
        Test: divisible by 17
          If true: throw to monkey 0
          If false: throw to monkey 1
    EOF
  }

  let(:tribe) { Tribe.from_input(example_input) }

  describe "parsing" do
    it "parses the example input into the correct number of monkeys" do
      expect(tribe.length).to eq(4)
    end

    it "it can parse a starting items correctly" do
      expect(tribe[0].items).to eq([79, 98])
      expect(tribe[1].items).to eq([54, 65, 75, 74])
      expect(tribe[2].items).to eq([79, 60, 97])
      expect(tribe[3].items).to eq([74])
    end

    it "it can parse an operation correctly" do
      expect(tribe[0].operation.run(5)).to eq(5 * 19)
      expect(tribe[1].operation.run(5)).to eq(5 + 6)
      expect(tribe[2].operation.run(5)).to eq(5 * 5)
      expect(tribe[3].operation.run(5)).to eq(5 + 3)
    end

    it "it can parse item test conditions correctly" do
      expect(tribe[0].worry_test.condition_met?(46)).to eq(true)
      expect(tribe[0].worry_test.condition_met?(47)).to eq(false)

      expect(tribe[1].worry_test.condition_met?(38)).to eq(true)
      expect(tribe[1].worry_test.condition_met?(39)).to eq(false)

      expect(tribe[2].worry_test.condition_met?(26)).to eq(true)
      expect(tribe[2].worry_test.condition_met?(27)).to eq(false)

      expect(tribe[3].worry_test.condition_met?(34)).to eq(true)
      expect(tribe[3].worry_test.condition_met?(35)).to eq(false)
    end

    it "can parse monkey if true correctly" do
      expect(tribe[0].worry_test.true_monkey).to eq(2)
      expect(tribe[1].worry_test.true_monkey).to eq(2)
      expect(tribe[2].worry_test.true_monkey).to eq(1)
      expect(tribe[3].worry_test.true_monkey).to eq(0)
    end

    it "can parse monkey if false correctly" do
      expect(tribe[0].worry_test.false_monkey).to eq(3)
      expect(tribe[1].worry_test.false_monkey).to eq(0)
      expect(tribe[2].worry_test.false_monkey).to eq(3)
      expect(tribe[3].worry_test.false_monkey).to eq(1)
    end

    it "can run a worry test" do
      expect(tribe[0].worry_test.run(46)).to eq(2)
      expect(tribe[0].worry_test.run(47)).to eq(3)
    end
  end

  describe "part 1" do
    it "returns the correct items after round 20 rounds" do
      tribe.run_round # Round 1
      expect(tribe[0].items.sort).to eq([20, 23, 26, 27])
      expect(tribe[1].items.sort).to eq([25, 167, 207, 401, 1046, 2080])
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 2
      expect(tribe[0].items.sort).to eq([695, 10, 71, 135, 350].sort)
      expect(tribe[1].items.sort).to eq([43, 49, 58, 55, 362].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 3
      expect(tribe[0].items.sort).to eq([16, 18, 21, 20, 122].sort)
      expect(tribe[1].items.sort).to eq([1468, 22, 150, 286, 739].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 4
      expect(tribe[0].items.sort).to eq([491, 9, 52, 97, 248, 34].sort)
      expect(tribe[1].items.sort).to eq([39, 45, 43, 258].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 5
      expect(tribe[0].items.sort).to eq([15, 17, 16, 88, 1037].sort)
      expect(tribe[1].items.sort).to eq([20, 110, 205, 524, 72].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 6
      expect(tribe[0].items.sort).to eq([8, 70, 176, 26, 34].sort)
      expect(tribe[1].items.sort).to eq([481, 32, 36, 186, 2190].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 7
      expect(tribe[0].items.sort).to eq([162, 12, 14, 64, 732, 17].sort)
      expect(tribe[1].items.sort).to eq([148, 372, 55, 72].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 8
      expect(tribe[0].items.sort).to eq([51, 126, 20, 26, 136].sort)
      expect(tribe[1].items.sort).to eq([343, 26, 30, 1546, 36].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 9
      expect(tribe[0].items.sort).to eq([116, 10, 12, 517, 14].sort)
      expect(tribe[1].items.sort).to eq([108, 267, 43, 55, 288].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      tribe.run_round # Round 10
      expect(tribe[0].items.sort).to eq([91, 16, 20, 98].sort)
      expect(tribe[1].items.sort).to eq([481, 245, 22, 26, 1092, 30].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      5.times { tribe.run_round } # Round 11-15
      expect(tribe[0].items.sort).to eq([83, 44, 8, 184, 9, 20, 26, 102].sort)
      expect(tribe[1].items.sort).to eq([110, 36].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])
      5.times { tribe.run_round } # Round 16-20
      expect(tribe[0].items.sort).to eq([10, 12, 14, 26, 34].sort)
      expect(tribe[1].items.sort).to eq([245, 93, 53, 199, 115].sort)
      expect(tribe[2].items.sort).to eq([])
      expect(tribe[3].items.sort).to eq([])

      expect(tribe[0].inspected_item_count).to eq(101)
      expect(tribe[1].inspected_item_count).to eq(95)
      expect(tribe[2].inspected_item_count).to eq(7)
      expect(tribe[3].inspected_item_count).to eq(105)

      expect(tribe.monkey_business_score).to eq(10605)
    end

  end

  describe "part 2" do
  end
end
