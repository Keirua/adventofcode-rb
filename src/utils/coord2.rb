# a struct for managing 2d objects
class Coord2
  attr_accessor :x, :y
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def manhattan
    (@x.negative? ? -@x : @x) + (@y.negative? ? -@y : @y)
  end

  def origin?
    @x.zero? && @y.zero?
  end

  def to_s
    "#{@x}, #{@y}"
  end

  def equal?(other)
    @x == other.x && @y == other.y
  end
end
