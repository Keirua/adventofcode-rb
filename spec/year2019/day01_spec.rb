require 'spec_helper'

RSpec.describe Year2019::Day01 do
  day = Year2019::Day01.new
  it 'computes the fuel out of a mass' do
    expect(day.calc_fuel(12)).to eq(2)
    expect(day.calc_fuel(14)).to eq(2)
    expect(day.calc_fuel(1969)).to eq(654)
    expect(day.calc_fuel(100_756)).to eq(33_583)
  end

  it 'solves part1' do
    input = <<~INPUT
      14
      12
      1969
      100756
    INPUT
    expect(day.part1(input)).to eq(2 + 2 + 654 + 33_583)
  end

  it 'solves part2' do
    expect(day.part2('some_input')).to eq(nil)
  end
end
