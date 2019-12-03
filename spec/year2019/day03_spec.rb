require 'spec_helper'

RSpec.describe Year2019::Day03 do
  day = Year2019::Day03.new
  it "can find intersection points" do

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(0, 10),
        Coord2.new(-5,3), Coord2.new(5, 3)
    )).to be(Coord2.new(0, 3))

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(0, 10),
        Coord2.new(-5,3), Coord2.new(-4, 3)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(0, 10),
        Coord2.new(5,3), Coord2.new(8, 3)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(0, 10),
        Coord2.new(-5,12), Coord2.new(5, 12)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(0, 10),
        Coord2.new(-5,-12), Coord2.new(5, -12)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(10, 0),
        Coord2.new(4,3), Coord2.new(4, -3)
    )).to be(Coord2.new(4, 0))

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(10, 0),
        Coord2.new(-4,3), Coord2.new(-4, -3)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(10, 0),
        Coord2.new(14,3), Coord2.new(14, -3)
    )).to be(nil)

    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(10, 0),
        Coord2.new(4,3), Coord2.new(4, 2)
    )).to be(nil)
    expect(day.intersection_point(
        Coord2.new(0,0), Coord2.new(10, 0),
        Coord2.new(4,-3), Coord2.new(4, -2)
    )).to be(nil)


  end

  it "solves part1" do
      input = <<-INPUT
R8,U5,L5,D3
U7,R6,D4,L4
      INPUT
    expect(day.part1(input)).to eq(6)
    day = Year2019::Day03.new
      input = <<-INPUT
R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83
      INPUT
    expect(day.part1(input)).to eq(159)
  end

  it "solves part2" do
    skip
    expect(day.part2('some_input')).to eq(nil)
  end
end
