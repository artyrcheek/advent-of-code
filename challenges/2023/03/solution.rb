# frozen_string_literal: true
module Year2023
  class Day03 < Solution

    def part_1
      engine_schematic = EngineSchematic.new(data)
      part_numbers = engine_schematic.part_numbers
      valid_part_numbers = part_numbers.select { |part_number| part_number.valid?(engine_schematic) }
      valid_part_numbers.map(&:number).sum
    end

    def part_2
      engine_schematic = EngineSchematic.new(data)
      symbol_positions = engine_schematic.symbol_positions
      part_numbers = engine_schematic.part_numbers

      found_part_numbers = []

      symbol_positions.sum do |position|
        remaining_part_numbers = part_numbers.filter { |part_number| !found_part_numbers.include?(part_number) }

        part_numbers_next_to_symbol = remaining_part_numbers.select { |part_number| part_number.next_to?(position) }
        found_part_numbers += part_numbers_next_to_symbol
        return 0 if found_part_numbers.size == 1

        part_numbers_next_to_symbol.map(&:number).reduce(:*)
      end
    end

    SYMBOL_REGEX = /[^0-9\.]/

    class EngineSchematic
      attr_reader :rows

      def initialize(rows)
        @rows = rows
      end

      def grid
        @grid ||= @rows.map(&:chars)
      end

      def cell_at(x, y)
        return nil if y < 0 || y >= grid.size
        return nil if x < 0 || x >= grid[y].size

        grid[y][x]
      end

      def symbol_positions
        grid.each_with_index.flat_map do |row, y|
          row.each_with_index.map do |cell, x|
            [x, y] if cell =~ SYMBOL_REGEX
          end
        end.compact
      end

      def valid_part_numbers
        symbol_positions.map do |position|
          part_numbers.select do |part_number|
            part_number.next_to(position)
          end
        end
      end

      def part_numbers
        @part_numbers ||= rows.each_with_index.flat_map do |row, y|
          numbers = row.scan(/\d+/) # Find numbers in the row
          numbers.each.map do |number|
            # Find the index of this exact number in the row
            # NOTE: there may be numbers that are substrings of other numbers
            # x = row.index(number) wont work because it will find the index of the first digit
            x = row.index(/\b#{number}\b/)
            PartNumber.new(number, x: x, y: y)
          end
        end
      end
    end

    private

    class PartNumber
      attr_reader :number
      attr_reader :neighbouring_symbol_positions

      def initialize(number, x:, y:)
        @number = number.to_i
        @x = x.to_i
        @y = y.to_i
        @neighbouring_symbol_positions = []
      end

      def ==(other)
        @number == other.number && @x == other.x && @y == other.y
      end

      def valid?(schematic)
        adjacent_cell_positions.any? do |position|
          x, y = position
          cell = schematic.cell_at(x, y)
          cell =~ SYMBOL_REGEX
        end
      end

      def adjacent_cell_positions
        adjacent_cell_directions.map do |direction|
          dx, dy = direction
          [@x + dx, @y + dy]
        end
      end

      def adjacent_cell_directions
        xrange = (-1..length)
        yrange = (-1..1)

        top_row = xrange.map { |x| [x, yrange.min] }
        bottom_row = xrange.map { |x| [x, yrange.max] }
        left_column = yrange.map { |y| [xrange.min, y] }
        right_column = yrange.map { |y| [xrange.max, y] }
        [*top_row, *bottom_row, *left_column, *right_column].uniq
      end

      def next_to?(position)
        x, y = position
        adjacent_cell_positions.include?([x, y])
      end

      def length
        @number.to_s.length
      end
    end
  end
end
