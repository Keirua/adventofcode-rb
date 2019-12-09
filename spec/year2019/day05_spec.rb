require 'spec_helper'

RSpec.describe Year2019::Day05 do
  day = Year2019::Day05.new

  it "solves part1" do
    expect(day.part1('some_input')).to eq('expected_result')
  end

  it "solves part2" do
    expect(day.part2('some_input')).to eq(nil)
  end
end
