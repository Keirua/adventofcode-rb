require 'spec_helper'

RSpec.describe Year2019::Day06 do
  day = Year2019::Day06.new
  it "parses the pairs" do
    input = <<-IN
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
    IN
    expected_result = [["COM", "B"], ["B", "C"], ["C", "D"],
     ["D", "E"], ["E", "F"], ["B", "G"], ["G", "H"],
     ["D", "I"], ["E", "J"], ["J", "K"], ["K", "L"]]
    expect(day.parse_pairs(input)).to eq(expected_result)
  end

  it "it finds the nb of orbits" do
    parents = {"B"=>"COM", "C"=>"B", "D"=>"C", "E"=>"D",
               "F"=>"E", "G"=>"B", "H"=>"G", "I"=>"D",
               "J"=>"E", "K"=>"J", "L"=>"K"}
    expect(day.find_nb_orbits(parents, 'L')).to eq(7)
    expect(day.find_nb_orbits(parents, 'D')).to eq(3)
    expect(day.find_nb_orbits(parents, 'B')).to eq(1)
    expect(day.find_nb_orbits(parents, 'COM')).to eq(0)
  end

  it "solves part1" do
    input = <<-IN
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
    IN
    expect(day.part1(input)).to eq(42)
  end

  it "solves part2" do
    expect(day.part2('some_input')).to eq(nil)
  end
end
