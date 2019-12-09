module Year2019
  # Solutions for day 02 of year 2019
  class Day02
    def part1(input)
      ic = IntCodeProgram.from(input)
      ic.program[1] = 12
      ic.program[2] = 2
      ic.run_program
      ic.program[0]
    end

    def part2(input)
      (1..100).each do |noun|
        (1..100).each do |verb|
          ic = IntCodeProgram.from(input)
          ic.program[1] = noun
          ic.program[2] = verb
          ic.run_program

          return 100 * noun + verb if ic.program[0] == 19_690_720
        end
      end
    end
  end
end
