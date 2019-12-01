module Year2019
  # Solutions for day 01 of year 2019
  class Day01
    def calc_fuel(m)
      m.to_i / 3 - 2
    end

    def part1(input)
      input.lines.map do |n|
        calc_fuel(n.to_i)
      end.sum
    end

    def part2(_input)
      nil
    end
  end
end
