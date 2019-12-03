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
      # puts a1, a2, b1, b2
      ip = nil
      bounds_x = [
          min(a1.x, a2.x),
          max(a1.x, a2.x)
      ]
      bounds_y = [
          min(a1.y, a2.y),
          max(a1.y, a2.y)
      ]
      # first line is horizontal
      if a1.y == a2.y
        # second line is vertical -> there can be an intersection
        if b2.x == b1.x
          ip = Coord2.new(b1.x, a1.y)
          # Then we check if the point actually intersects
          bounds_b = [
              min(b1.y, b2.y),
              max(b1.y, b2.y)
          ]

          return nil if b1.x < bounds_x[0] || b1.x > bounds_x[1]
          return nil if bounds_b[0] > bounds_y[0] || bounds_b[1] < bounds_y[1]
        end
      # first line is vertical
      elsif a1.x == a2.x
        # second line is horizontal -> there can be an intersection
        if b2.y == b1.y
          ip = Coord2.new(a1.x, b1.y)
          # Then we check if the point actually intersects
          bounds_b = [
              min(b1.x, b2.x),
              max(b1.x, b2.x)
          ]
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
      (1..w1.count-1).each do |i|
        (1..w2.count-1).each do |j|
          p1 = w1[i-1]
          p2 = w1[i]
          p3 = w2[j-1]
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
      w1 = movements_to_coords(movements1)
      w2 = movements_to_coords(movements2)
      max = 10000000
      intersections = find_intersections(w1, w2)
      intersections.each do |i|
        if i.manhattan < max && i.manhattan != 0
          max = i.manhattan
        end
      end
      max
    end

    def part2(input)
      nil
    end
  end
end
