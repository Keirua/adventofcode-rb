module Year2019
  # Solutions for day 04 of year 2019
  class Day04
    def has_doubles?(n)
      ns = n.to_s
      for i in 0...(ns.size-1) do
        return true if (ns[i+1] == ns[i])
      end
      false
    end

    def has_doubles_with_length2?(n)
      ns = n.to_s
      i = 0

      while i < ns.size-1 do
        start = i
        i += 1 while i <= ns.size && ns[i] == ns[start]
        return true if i-start == 2
      end
      false
    end

    def always_increasing_digits?(n)
      ns = n.to_s
      for i in 0...(ns.size-1) do
        return false if (ns[i+1].to_i < ns[i].to_i)
      end
      true
    end

    def match_part2(n)
      always_increasing_digits?(n) && has_doubles_with_length2?(n)
    end

    def part1(input)
      bounds  = input.split('-').map(&:to_i).minmax
      (bounds[0]..bounds[1]).select do |n|
        always_increasing_digits?(n) && has_doubles?(n)
      end.size
    end

    def part2(input)
      # 2438 is incorrect, as is 2098
      bounds  = input.split('-').map(&:to_i).minmax
      (bounds[0]..bounds[1]).select do |n|
        match_part2(n)
      end.size
    end
  end
end
