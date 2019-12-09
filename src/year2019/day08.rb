module Year2019
  # Solutions for day 08 of year 2019
  class Day08
    def split_by(s, n)
      s.each_char.each_slice(n).map(&:join)
    end

    def layers(input, w, h)
      s = w*h
      split_by(input, s).map do |subs| split_by(subs, w) end
    end

    def part1(input)
      "expected_result"
    end

    def part2(input)
      nil
    end
  end
end
