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
      pairs.each { |p, c| parents[c] = p }
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

    # https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm#Using_a_priority_queue
    def dijkstra(neighbours, start_node)
      unvisited = neighbours.keys
      distances = {}
      prev = {}
      neighbours.keys.each do |k|
        distances[k] = 2**32 # arbitrary large number
        prev[k] = nil
      end
      distances[start_node] = 0

      until unvisited.empty?
        current = unvisited.min_by { |n| distances[n] }
        neighbours[current].each do |n|
          alt =  distances[current] + 1
          if alt < distances[n]
            distances[n] = alt
            prev[n] = current
          end
        end
        unvisited -= [current]
      end
      [distances, prev]
    end

    def part2(input)
      pairs = parse_pairs(input)
      neighbours = build_neighbours(pairs)
      start = neighbours['YOU'].first
      goal = neighbours['SAN'].first

      distances, _predecessors = dijkstra(neighbours, start)
      distances[goal]
    end
  end
end
