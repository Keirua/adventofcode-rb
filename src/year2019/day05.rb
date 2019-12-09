module Year2019
  # Solutions for day 05 of year 2019
  class Day05
    def part1(input)
      ic = IntCodeProgram.from(input)
      ic.set_input(1)
      ic.run_program
      ic.out
    end

    def part2(input)
      ic = IntCodeProgram.from(input)
      ic.set_input(5)
      ic.run_program
      ic.out
    end
  end
end
