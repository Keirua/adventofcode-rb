require 'spec_helper'

RSpec.describe Year2019::Day05 do
  day = Year2019::Day05.new

  it "solves part1" do
    ic = IntCodeProgram.new([1002,4,3,4,33])
    ic.step
    expect(ic.program).to eq([1002, 4, 3, 4, 99])
  end

  it "properly handles equal using position mode" do
    ic = IntCodeProgram.new([3,9,8,9,10,9,4,9,99,-1,8], 8)
    ic.run_program
    expect(ic.out).to eq([1])
    ic = IntCodeProgram.new([3,9,8,9,10,9,4,9,99,-1,8], 23)
    ic.run_program
    expect(ic.out).to eq([0])
  end

  it "properly handles less than using position mode" do
    ic = IntCodeProgram.new([3,9,7,9,10,9,4,9,99,-1,8], 4)
    ic.run_program
    expect(ic.out).to eq([1])
    ic = IntCodeProgram.new([3,9,7,9,10,9,4,9,99,-1,8], 23)
    ic.run_program
    expect(ic.out).to eq([0])
  end


  it "properly handles equal using immediate mode" do
    ic = IntCodeProgram.new([3,3,1108,-1,8,3,4,3,99], 8)
    ic.run_program
    expect(ic.out).to eq([1])
    ic = IntCodeProgram.new([3,3,1108,-1,8,3,4,3,99], 23)
    ic.run_program
    expect(ic.out).to eq([0])
  end

  it "properly handles less than using immediate mode" do
    ic = IntCodeProgram.new([3,3,1107,-1,8,3,4,3,99], 4)
    ic.run_program
    expect(ic.out).to eq([1])
    ic = IntCodeProgram.new([3,3,1107,-1,8,3,4,3,99], 23)
    ic.run_program
    expect(ic.out).to eq([0])
  end
end
