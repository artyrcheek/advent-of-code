# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day07 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/07/input.txt")) }
  let(:example_input) {
    <<~EOF
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    EOF
  }

  let(:terminal_reader) {
    TerminalReader.new(chomped_example)
  }

  # Run the terminal before each test
  before(:each) do
    terminal_reader.run
  end

  describe "part 1" do
    it "it can move directories properly" do
      expect(terminal_reader.current_directory.path).to eq('d')
    end

    it "it creates the correct amount of subdirectories" do
      expect(terminal_reader.root_directory.subdirectories.count).to eq(2)
    end

    it "it creates the correct amount of files" do
      expect(terminal_reader.root_directory.children.count).to eq(4)
    end

    it "it returns the correct total size" do
      expect(terminal_reader.root_directory.size).to eq(48381165)
    end

    it "it returns the correct number of total subdirectories" do
      expect(terminal_reader.root_directory.all_subdirectories.length).to eq(3)
    end

    it "it returns the correct sum of subdirectories under 100_000" do
      subdirectories = terminal_reader.root_directory.all_subdirectories
      expect(subdirectories.select{|sd| sd.size < 100_000}.sum(&:size)).to eq(95437)
    end
  end

  describe "part 2" do
  end
end
