module Year2019
  # Solutions for day 02 of year 2019
  class Day02
    attr_accessor :program
    def initialize(program = [])
      @ip = 0
      @program = program
    end

    def step
      case @program[@ip]
      when 1
        @program[@program[@ip+3]] = @program[@program[@ip+1]] + @program[@program[@ip+2]]
      when 2
        @program[@program[@ip+3]] = @program[@program[@ip+1]] * @program[@program[@ip+2]]
      end
      @ip += 4
    end

    def run_program
      @ip = 0
      while @program[@ip] != 99
        step
      end
    end

    def part1(input)
      @program = input.split(',').map(&:to_i)
      @program[1] = 12
      @program[2] = 2
      run_program
      @program[0]
    end

    def part2(input)
      nil
    end
  end
end
