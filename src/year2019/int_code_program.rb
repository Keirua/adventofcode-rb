class IntCodeProgram
  attr_accessor :program
  attr_reader :out

  ADD = 1
  MUL = 2
  INPUT = 3
  OUTPUT = 4

  MODE_IMMEDIATE = 1
  MODE_POSITION = 0

  def self.from(input)
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

  def read_param(mode, v)
    case mode
    when MODE_POSITION
      @program[v]
    when MODE_IMMEDIATE
      v
    else
      raise 'should not happen'
    end

  end

  def step
    opcode, mode_first, mode_second, mode_third = decode_instruction(@program[@ip])

    case opcode
    when ADD
      a = @program[read_param(mode_first, @ip + 1)]
      b = @program[read_param(mode_second, @ip + 2)]
      @program[@program[@ip + 3]] = a + b
      @ip += 4
    when MUL
      a = @program[read_param(mode_first, @ip + 1)]
      b = @program[read_param(mode_second, @ip + 2)]
      @program[@program[@ip + 3]] = a * b
      @ip += 4
    when INPUT
      a = read_param(mode_first, @ip + 1)
      @program[a] = 1
      @ip += 2
    when OUTPUT
      a = read_param(mode_first, @ip + 1)
      @out << @program[a]
      @ip += 2
    end
  end

  def run_program
    @ip = 0
    step while @program[@ip] != 99
  end
end