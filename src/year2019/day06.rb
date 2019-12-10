module Year2019
  # Solutions for day 06 of year 2019
  class Day06
    def parse_pairs(input)
      input.lines.map { |l| l.strip.split ')' }
    end

    def find_nb_orbits(parents, node)
      nb_orbits = 0
      while node != 'COM'
        node = parents[node]
        nb_orbits += 1
      end
      nb_orbits
    end

    def part1(input)
      pairs = parse_pairs(input)
      parents = {}
      pairs.each { |p,c| parents[c] = p }
      parents.keys.sum do |k|
        find_nb_orbits(parents, k)
      end
    end

    def build_neighbours(pairs)
      neighbours = {}
      pairs.each do |a, b|
        neighbours[a] = []
        neighbours[b] = []
      end

      pairs.each do |a, b|
        neighbours[a] << b
        neighbours[b] << a
      end

      neighbours
    end

    def part2(input)
      input = <<-BEGI
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
      BEGI

      pairs = parse_pairs(input)
      neighbours = build_neighbours(pairs)
      start = neighbours['YOU'].first
      goal = neighbours['SAN'].first
      pp neighbours, start, goal
    end
  end
end
