module Year2019
  # Solutions for day 03 of year 2019
  class Day03
    Movement = Struct.new(:direction, :distance)

    def line_to_movements(line)
      l1 = line.split(',')
      l1.map { |m| Movement.new(m[0], m[1..].to_i) }
    end

    def movements_to_coords(movements)
      list = [Coord2.new]
      movements.each do |m|
        prev = list[-1]
        case m.direction
        when 'D'
          list << Coord2.new(prev.x, prev.y - m.distance)
        when 'U'
          list << Coord2.new(prev.x, prev.y + m.distance)
        when 'R'
          list << Coord2.new(prev.x + m.distance, prev.y)
        when 'L'
          list << Coord2.new(prev.x - m.distance, prev.y)
        else
          puts 'not supposed to happen'
        end
      end
      list
    end

    # took me a while to figure out, a drawing and a video helped
    # https://www.youtube.com/watch?v=UeN0i6l_nYU
    def intersection_point(a1, a2, b1, b2)
      ip = nil
      bounds_x = bounds(a1.x, a2.x)
      bounds_y = bounds(a1.y, a2.y)
      # first line is horizontal
      if a1.y == a2.y
        # second line is vertical -> there can be an intersection
        if b2.x == b1.x
          ip = Coord2.new(b1.x, a1.y)
          # Then we check if the point actually intersects
          bounds_b = bounds(b1.y, b2.y)

          return nil if b1.x < bounds_x[0] || b1.x > bounds_x[1]
          return nil if bounds_b[0] > bounds_y[0] || bounds_b[1] < bounds_y[1]
        end
      # first line is vertical
      elsif a1.x == a2.x
        # second line is horizontal -> there can be an intersection
        if b2.y == b1.y
          ip = Coord2.new(a1.x, b1.y)
          # Then we check if the point actually intersects
          bounds_b = bounds(b1.x, b2.x)
          return nil if b1.y < bounds_y[0] || b1.y > bounds_y[1]
          return nil if bounds_b[0] > bounds_x[0] || bounds_b[1] < bounds_x[1]
        end
      end

      ip
    end

    def min(a, b)
      a < b ? a : b
    end

    def max(a, b)
      a > b ? a : b
    end

    def find_intersections(w1, w2)
      intersections = []
      (1..w1.count - 1).each do |i|
        (1..w2.count - 1).each do |j|
          p1 = w1[i - 1]
          p2 = w1[i]
          p3 = w2[j - 1]
          p4 = w2[j]
          ip = intersection_point(p1, p2, p3, p4)
          intersections << ip if !ip.nil?
        end
      end
      intersections
    end

    def part1(input)
      movements1 = line_to_movements(input.lines[0])
      movements2 = line_to_movements(input.lines[1])
      intersections = intersections_from_movements(movements1, movements2)
      max = 10_000_000
      intersections.each do |i|
        max = i.manhattan if i.manhattan < max && i.manhattan != 0
      end
      max
    end

    def nb_steps(ip, movements)
      steps = 0
      pos = Coord2.new
      lut = {
        'U' => Coord2.new(0, 1),
        'D' => Coord2.new(0, -1),
        'L' => Coord2.new(-1, 0),
        'R' => Coord2.new(1, 0)
      }
      movements.each do |m|
        i = 0

        while !pos.equal?(ip) && i < m.distance
          i += 1
          steps += 1
          pos.x += lut[m.direction].x
          pos.y += lut[m.direction].y
        end
        break if pos.equal?(ip)
      end
      steps
    end

    def part2(input)
      movements1 = line_to_movements(input.lines[0])
      movements2 = line_to_movements(input.lines[1])
      intersections = intersections_from_movements(movements1, movements2)
      best_sum_of_steps = nil

      intersections.each do |i|
        sum_of_steps = nb_steps(i, movements1) + nb_steps(i, movements2)
        if best_sum_of_steps.nil? || sum_of_steps < best_sum_of_steps
          best_sum_of_steps = sum_of_steps if sum_of_steps.positive?
        end
      end

      best_sum_of_steps
    end

    private

    def bounds(a1, a2)
      [a1, a2].minmax
    end

    def intersections_from_movements(movements1, movements2)
      w1 = movements_to_coords(movements1)
      w2 = movements_to_coords(movements2)
      find_intersections(w1, w2)
    end
  end
end
