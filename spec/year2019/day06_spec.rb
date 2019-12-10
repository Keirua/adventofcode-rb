require 'spec_helper'

RSpec.describe Year2019::Day06 do
  day = Year2019::Day06.new
  input1 = <<~IN
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

  input2 = <<~IN
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
    K)YOU
    I)SAN
  IN

  it 'parses the pairs' do
    expected_result = [%w[COM B], %w[B C], %w[C D],
                       %w[D E], %w[E F], %w[B G], %w[G H],
                       %w[D I], %w[E J], %w[J K], %w[K L]]
    expect(day.parse_pairs(input1)).to eq(expected_result)
  end

  it 'it finds the nb of orbits' do
    parents = { 'B' => 'COM', 'C' => 'B', 'D' => 'C', 'E' => 'D',
                'F' => 'E', 'G' => 'B', 'H' => 'G', 'I' => 'D',
                'J' => 'E', 'K' => 'J', 'L' => 'K' }
    expect(day.find_nb_orbits(parents, 'L')).to eq(7)
    expect(day.find_nb_orbits(parents, 'D')).to eq(3)
    expect(day.find_nb_orbits(parents, 'B')).to eq(1)
    expect(day.find_nb_orbits(parents, 'COM')).to eq(0)
  end

  it 'solves part1' do
    expect(day.part1(input1)).to eq(42)
  end

  it 'finds neighbours' do
    pairs = day.parse_pairs(input2)
    neighbours = day.build_neighbours(pairs)
    expect(neighbours['YOU']).to eq(['K'])
    expect(neighbours['SAN']).to eq(['I'])
    expect(neighbours['COM']).to eq(['B'])
    expect(neighbours['B'].sort).to eq(%w[COM C G].sort)
  end

  it 'solves part2' do
    expect(day.part2(input2)).to eq(4)
  end
end
