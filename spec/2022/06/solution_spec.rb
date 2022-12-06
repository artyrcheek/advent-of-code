# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2022::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2022/06/input.txt")) }

  let(:example_datastreams) {
    %w(
      mjqjpqmgbljsphdztnvjfqwrcgsmlb
      bvwbjplbgvbhsrlpgdmjqwftvncz
      nppdvjthqldpwncqszvftbrmjlhg
      nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
      zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
    ).map { |input| DatastreamBuffer.new(input) }
  }


  describe "part 1" do
    it "returns the correct start of packet marker" do
      expect(example_datastreams[0].start_of_packet_marker_index).to eq(7)
      expect(example_datastreams[1].start_of_packet_marker_index).to eq(5)
      expect(example_datastreams[2].start_of_packet_marker_index).to eq(6)
      expect(example_datastreams[3].start_of_packet_marker_index).to eq(10)
      expect(example_datastreams[4].start_of_packet_marker_index).to eq(11)
    end
  end

  describe "part 2" do
    it "returns the correct start of message marker" do
      expect(example_datastreams[0].start_of_message_marker_index).to eq(19)
      expect(example_datastreams[1].start_of_message_marker_index).to eq(23)
      expect(example_datastreams[2].start_of_message_marker_index).to eq(23)
      expect(example_datastreams[3].start_of_message_marker_index).to eq(29)
      expect(example_datastreams[4].start_of_message_marker_index).to eq(26)
    end
  end
end
