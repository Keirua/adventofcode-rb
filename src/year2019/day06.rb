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
      # parents.keys.inject(0) do |k, nb|
      #   nb + find_nb_orbits(parents, k)
      # end
      # puts find_nb_orbits(parents, 'L')
      # puts find_nb_orbits(parents, 'D')
    end

    def part2(input)
      nil
    end
  end
end
