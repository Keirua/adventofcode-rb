module Year2019
  # Solutions for day 05 of year 2019
  class Day05
    def part1(input)
      ic = IntCodeProgram.from(input)
      ic.run_program
      # # ic = IntCodeProgram.new([1002,4,3,4,33])
      # puts ic.program[225].inspect
      # puts ic.program[0...50].inspect
      # ic.step
      # ic.step
      # puts ic.program[0...50].inspect
      ic.out
    end

    def part2(input)
      nil
    end
  end
end
