class IntCodeProgram
  attr_accessor :program
  def self.from_input(input)
    self.new(input.split(',').map(&:to_i))
  end

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
end