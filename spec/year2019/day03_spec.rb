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

  it "counts steps for an intersection" do
    input = <<-INPUT
R8,U5,L5,D3
U7,R6,D4,L4
    INPUT

    movements1 = day.line_to_movements(input.lines[0])
    movements2 = day.line_to_movements(input.lines[1])
    w1 = day.movements_to_coords(movements1)
    w2 = day.movements_to_coords(movements2)
    intersections = day.find_intersections(w1, w2).filter { |c| c.x != 0 && c.y != 0 }

    expect(day.nb_steps(intersections[0], movements1)).to be 15
    expect(day.nb_steps(intersections[0], movements2)).to be 15
    expect(day.nb_steps(intersections[1], movements1)).to be 20
    expect(day.nb_steps(intersections[1], movements2)).to be 20
  end

  it "solves part2" do
    input1 = <<-INPUT
R8,U5,L5,D3
U7,R6,D4,L4
INPUT
    input2 = <<-INPUT
R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83
INPUT
    input3 = <<-INPUT
R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
INPUT
    test_data = [#[input1, 30],
                 [input2, 610],
                 [input3, 410]]
    test_data.each do |input, expected_steps|
      day = Year2019::Day03.new
      expect(day.part2(input)).to eq(expected_steps)
    end
  end
end
