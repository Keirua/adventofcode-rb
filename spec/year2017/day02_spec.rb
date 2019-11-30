require 'spec_helper'

RSpec.describe Year2017::Day02 do
  day = Year2017::Day02.new

  it 'solves part1' do
    input = <<~IO
      5 1 9 5
      7 5 3
      2 4 6 8
    IO
    expect(day.part1(input)).to eq(18)
  end

  it 'finds even divisors' do
    expect(day.find_divisors([5, 9, 2, 8])).to eq(4)
    expect(day.find_divisors([9, 4, 7, 3])).to eq(3)
    expect(day.find_divisors([3, 8, 6, 5])).to eq(2)
  end

  it 'solves part2' do
    input = <<~IO
      5 9 2 8
      9 4 7 3
      3 8 6 5
    IO

    expect(day.part2(input)).to eq(9)
  end
end
