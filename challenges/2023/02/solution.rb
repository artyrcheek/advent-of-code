# frozen_string_literal: true
module Year2023
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      games = data.map { |line| Game.parse(line) }
      valid_game_ids = games.select { |game| game.sets.all?(&:valid?) }.map(&:game_id)
      valid_game_ids.map(&:to_i).sum
    end

    def part_2
      data.map { |line| Game.parse(line) }.map(&:power).sum
    end

    class Game
      attr_reader :game_id, :sets

      GAME_REGEX = /Game (?<game_id>\d+): (?<sets>.*)/

      def self.parse(line)
        game_id, sets_string = line.match(GAME_REGEX).captures
        sets = sets_string.split(";").map { |set_string| Set.parse(set_string) }
        new(game_id, sets)
      end

      def initialize(game_id, sets)
        @game_id = game_id
        @sets = sets
      end

      def power
        minimum_cubes_necessary.values.reduce(&:*)
      end

      def minimum_cubes_necessary
        @sets.each_with_object({}) do |set, memo|
          memo.merge!(set.colors) { |_, old_count, new_count| [old_count, new_count].max }
        end
      end
    end

    class Set
      attr_reader :colors

      MAX_COLORS = {
        red: 12,
        green: 13,
        blue: 14,
      }

      def self.parse(line)
        colors = MAX_COLORS.keys.map do |key|
          [key, color_count(line, key)]
        end.to_h
        new(colors)
      end

      def self.color_count(line, color)
        line.scan(/(\d+) #{color}/).flatten.first.to_i
      end

      def initialize(colors)
        @colors = colors
      end

      def power
      end

      def valid?
        @colors.all? { |color, count| count <= MAX_COLORS[color] }
      end
    end
  end
end
