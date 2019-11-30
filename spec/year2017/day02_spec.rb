require 'spec_helper'

RSpec.describe Year2017::Day02 do
  it "solves part1" do
    input = <<-IO
5 1 9 5
7 5 3
2 4 6 8
    IO
    d = Year2017::Day02.new
    expect(d.part1(input)).to eq(18)
  end

  it "solves part2" do
    d = Year2017::Day02.new
    expect(d.part2('some_input')).to eq(nil)
  end
end
