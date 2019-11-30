module Year2017
  class Day02
    def part1(input)
      input.lines.map do |line|
        numbers = line.strip.split(' ').map(&:to_i)
        minmax = numbers.minmax
        minmax[1] - minmax[0]
      end.sum
    end

    def part2(input)
      nil
    end
  end
end
