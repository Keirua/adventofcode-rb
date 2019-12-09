require 'spec_helper'

RSpec.describe Year2019::Day08 do
  day = Year2019::Day08.new

  it "can the base data into layers" do
    input = '123456789012'
    expect(day.layers(input, 3, 2)).to eq([['123','456'], ['789', '012']])
  end

  it "solves part2" do
    expect(day.part2('some_input')).to eq(nil)
  end
end
