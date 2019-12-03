module Year2019
  class Coord2
    attr_accessor :x, :y
    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end
  end

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
      # first line is horizontal
      if a1.y == a2.y
        # second line is vertical -> there can be an intersection
        ip = Coord2.new(b1.x, a1.y) if b2.x == b1.x
        # Then we check if the point actually intersects
        bounds = [
          min(a1.x, a2.x),
          max(a1.x, a2.x)
        ]
        ip = nil if b1.x < bounds[0] || b1.x > bounds[0] || b2.x < bounds[0] || b2.x > bounds[0]
      # first line is vertical
      elsif a1.y == a2.y
        # second line is horizontal -> there can be an intersection
        ip = Coord2.new(a1.x, b1.y) if b2.y == b1.y
        # Then we check if the point actually intersects
        bounds = [
            min(a1.y, a2.y),
            max(a1.y, a2.y)
        ]
        ip = nil if b1.y < bounds[0] || b1.y > bounds[0] || b2.y < bounds[0] || b2.y > bounds[0]
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
      (1..w1.count).each do |i|
        (1..w2.count).each do |j|
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
      intersections = find_intersections(w1, w2)
      intersections
      # l1.map { |c| [c.x, c.y].join(' ') }
    end

    def part2(input)
      nil
    end
  end
end
