class Coord2
  attr_accessor :x, :y
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def manhattan
    (@x < 0 ? -@x : @x) + (@y < 0 ? -@y : @y)
  end

  def to_s
    "#{@x}, #{@y}"
  end

  def equal?(b)
    @x == b.x && @y == b.y
  end
end
