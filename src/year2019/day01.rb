module Year2019
  # Solutions for day 01 of year 2019
  class Day01
    def calc_fuel(m)
      m / 3 - 2
    end

    def part1(input)
      input.lines.map(&:to_i).sum { |n| calc_fuel(n) }
    end

    def calc_fuel_adjusted(m)
      fuel = calc_fuel(m)
      total_fuel = 0
      while fuel >= 0
        total_fuel += fuel
        fuel = calc_fuel(fuel)
      end
      total_fuel
    end

    def part2(input)
      input.lines.map(&:to_i).sum { |n| calc_fuel_adjusted(n) }
    end
  end
end
