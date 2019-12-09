class IntCodeProgram
  attr_accessor :program
  def self.from_input(input)
    self.new(input.split(',').map(&:to_i))
  end

  def initialize(program = [])
    @ip = 0
    @program = program
    @out = []
  end

  def decode_instruction(instruction)
    instruction = instruction.to_s.rjust(5, '0')
    mode_first = instruction[2].to_i
    mode_second = instruction[1].to_i
    mode_third = instruction[0].to_i
    opcode = instruction[3..].to_i
    [opcode, mode_first, mode_second, mode_third]
  end

  def step
    opcode, mode_first, mode_second, mode_third = decode_instruction(@program[@ip])

    case opcode
    when 1
      a = @program[@program[@ip + 1]]
      b = @program[@program[@ip + 2]]
      @program[@program[@ip + 3]] = a + b
    when 2
      a = @program[@program[@ip + 1]]
      b = @program[@program[@ip + 2]]
      @program[@program[@ip + 3]] = a * b
    when 3
      a = @program[@program[@ip + 1]]
      @program[a] = 1
    when 4
      a = @program[@program[@ip + 1]]
      @out << @program[a]
    end
    @ip += 4
  end

  def run_program
    @ip = 0
    step while @program[@ip] != 99
  end
end