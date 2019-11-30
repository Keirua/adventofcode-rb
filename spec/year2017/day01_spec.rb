require 'spec_helper'

RSpec.describe Year2017::Day01 do
  day = Year2017::Day01.new

  it 'solves part1' do
    expect(day.part1('1122')).to eq(3)
    expect(day.part1('1111')).to eq(4)
    expect(day.part1('1234')).to eq(0)
    expect(day.part1('91212129')).to eq(9)
  end

  it 'solves part2' do
    expect(day.part2('1212')).to eq(6)
    expect(day.part2('1221')).to eq(0)
    expect(day.part2('123425')).to eq(4)
    expect(day.part2('123123')).to eq(12)
    expect(day.part2('12131415')).to eq(4)
  end
end
