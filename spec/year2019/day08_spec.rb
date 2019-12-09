require 'spec_helper'

RSpec.describe Year2019::Day08 do
  day = Year2019::Day08.new

  it 'can the base data into layers' do
    input = '123456789012'
    expect(day.split_by(input, 3*2)).to eq(%w[123456 789012])
  end

end
