require 'spec_helper'

RSpec.describe Year2019::Day02 do
  day = Year2019::Day02.new

  it "can apply the add operation" do
    day = Year2019::Day02.new([1, 5, 6, 0, 99, 7, 9])
    day.step
    expect(day.program).to eq([16, 5, 6, 0, 99, 7, 9])
  end

  it "can apply the mul operation" do
    day = Year2019::Day02.new([2, 5, 6, 0, 99, 7, 9])
    day.step
    expect(day.program).to eq([63, 5, 6, 0, 99, 7, 9])
  end

  it "can run a few sample programs" do
    samples = [
        [[1,0,0,0,99], [2,0,0,0,99]],
        [[2,3,0,3,99], [2,3,0,6,99]],
        [[2,4,4,5,99,0], [2,4,4,5,99,9801]],
        [[1,1,1,4,99,5,6,0,99], [30,1,1,4,2,5,6,0,99]]
    ]
    samples.each do |initial_program, final_program|
      day = Year2019::Day02.new(initial_program)
      day.run_program
      expect(day.program).to eq(final_program)
    end
  end

  it "solves part1" do
    # expect(day.part1('some_input')).to eq('expected_result')
  end

  it "solves part2" do
    # expect(day.part2('some_input')).to eq(nil)
  end
end
