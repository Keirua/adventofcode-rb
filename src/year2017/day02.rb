module Year2017
  # Solutions for day 2
  class Day02
    def solve_puzzle(input)
      input.lines.map do |line|
        numbers = line.strip.split(' ').map(&:to_i)
        yield numbers
      end.sum
    end

    def part1(input)
      solve_puzzle(input) do |numbers|
        minmax = numbers.minmax
        minmax[1] - minmax[0]
      end
    end

    def find_divisors(numbers)
      (0..numbers.length).each do |i|
        curr = numbers[i]
        others = numbers - [curr]
        divisor = others.detect { |e| (e % curr).zero? }
        return divisor / curr if !divisor.nil?
      end
    end

    def part2(input)
      solve_puzzle(input) { |numbers| find_divisors(numbers) }
    end
  end
end
