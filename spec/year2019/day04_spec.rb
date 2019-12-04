require 'spec_helper'

RSpec.describe Year2019::Day04 do
  day = Year2019::Day04.new

  it "finds always increasing digits" do
    expect(day.always_increasing_digits?(1111)).to eq(true)
    expect(day.always_increasing_digits?(1234)).to eq(true)
    expect(day.always_increasing_digits?(1230)).to eq(false)
  end

  it "solves part2" do
    expect(day.match_part2(123444)).to eq(false)
    expect(day.match_part2(111122)).to eq(true)
    expect(day.match_part2(112233)).to eq(true)
    expect(day.match_part2(113444)).to eq(true)
    expect(day.match_part2(1134444)).to eq(true)
    expect(day.match_part2(788999)).to eq(true)
    expect(day.match_part2(566689)).to eq(false)
  end

end
