require 'spec_helper'

RSpec.describe IntCodeProgram do
  it 'can apply the add operation' do
    day = IntCodeProgram.new([1, 5, 6, 0, 99, 7, 9])
    day.step
    expect(day.program).to eq([16, 5, 6, 0, 99, 7, 9])
  end

  it 'can apply the mul operation' do
    day = IntCodeProgram.new([2, 5, 6, 0, 99, 7, 9])
    day.step
    expect(day.program).to eq([63, 5, 6, 0, 99, 7, 9])
  end

  it 'can run a few sample programs' do
    samples = [
      [[1, 0, 0, 0, 99], [2, 0, 0, 0, 99]],
      [[2, 3, 0, 3, 99], [2, 3, 0, 6, 99]],
      [[2, 4, 4, 5, 99, 0], [2, 4, 4, 5, 99, 9801]],
      [[1, 1, 1, 4, 99, 5, 6, 0, 99], [30, 1, 1, 4, 2, 5, 6, 0, 99]]
    ]
    samples.each do |initial_program, final_program|
      day = IntCodeProgram.new(initial_program)
      day.run_program
      expect(day.program).to eq(final_program)
    end
  end
end
