module Year2019
  # Solutions for day 02 of year 2019
  class Day02
    attr_accessor :program
    def initialize(program = [])
      @ip = 0
      @program = program
    end

    def step
      a = @program[@program[@ip + 1]]
      b = @program[@program[@ip + 2]]
      case @program[@ip]
      when 1
        @program[@program[@ip + 3]] = a + b
      when 2
        @program[@program[@ip + 3]] = a * b
      end
      @ip += 4
    end

    def run_program
      @ip = 0
      step while @program[@ip] != 99
    end

    def part1(input)
      @program = input.split(',').map(&:to_i)
      @program[1] = 12
      @program[2] = 2
      run_program
      @program[0]
    end

    def part2(input)
      (1..100).each do |noun|
        (1..100).each do |verb|
          @program = input.split(',').map(&:to_i)
          @program[1] = noun
          @program[2] = verb
          run_program

          return 100 * noun + verb if @program[0] == 19_690_720
        end
      end
    end
  end
end
