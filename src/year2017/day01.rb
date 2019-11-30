module Year2017
  class Day01
    def part1_v2(input)
      numbers = input.strip.split('').map(&:to_i)
      numbers << numbers[0]

      numbers.each_cons(2).map { |x, y| x == y ? x : 0 }.sum
    end

    def part1(input)
      numbers = input.strip.split('').map(&:to_i)
      sum = 0

      numbers.each_with_index do |v, k|
        sum += v.to_i if v == numbers[(k + 1) % numbers.size]
      end

      sum
    end

    def part2(input)
      numbers = input.strip.split('').map(&:to_i)

      numbers.each_with_index.inject(0) do |sum, item|
        v, k = item
        v == numbers[(k + (numbers.size / 2)) % numbers.size] ? sum + v : sum
      end
    end
  end
end
