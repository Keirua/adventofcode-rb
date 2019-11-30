require 'spec_helper'

RSpec.describe Year2017::Day01 do
  it 'solves part1' do
    d = Year2017::Day01.new
    expect(d.part1('1122')).to eq(3)
    expect(d.part1('1111')).to eq(4)
    expect(d.part1('1234')).to eq(0)
    expect(d.part1('91212129')).to eq(9)
  end

  it 'solves part2' do
    d = Year2017::Day01.new
    expect(d.part2('1212')).to eq(6)
    expect(d.part2('1221')).to eq(0)
    expect(d.part2('123425')).to eq(4)
    expect(d.part2('123123')).to eq(12)
    expect(d.part2('12131415')).to eq(4)
  end
end
