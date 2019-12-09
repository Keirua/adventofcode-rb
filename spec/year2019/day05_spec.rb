require 'spec_helper'

RSpec.describe Year2019::Day05 do
  day = Year2019::Day05.new

  it "solves part1" do
    ic = IntCodeProgram.new([1002,4,3,4,33])
    ic.step
    expect(ic.program).to eq([1002, 4, 3, 4, 99])
  end

  it "solves part2" do
    expect(day.part2('some_input')).to eq(nil)
  end
end
