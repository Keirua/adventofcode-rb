module Year2019
  # Solutions for day 08 of year 2019
  class Day08
    def split_by(s, n)
      s.each_char.each_slice(n).map(&:join)
    end

    def find_layers(input, w, h)
      split_by(input, w * h)
    end

    def split_layer(layer, w)
      split_by(layer, w)
    end

    def part1(input)
      w = 25
      h = 6
      layers = find_layers(input.strip, w, h)
      # not 1364 (too low)
      layers.sort_by! { |v| v.count('0') }
      layers[0].count('1') * layers[0].count('2')
    end

    def remap_layers(layers, w, h)
      (0...(w * h)).map do |i|
        layers.map do |l|
          l[i]
        end.join
      end
    end

    def part2(input)
      w = 25
      h = 6

      layers = find_layers(input.strip, w, h)
      remapped_layer = remap_layers(layers, w, h)

      letters = remapped_layer.map do |s|
        s.split('').find { |v| v != '2' }
      end
      puts
      screen = letters.map { |v| v == '1' ? '█' : ' ' }
      screen.each_slice(w).map(&:join)
    end
  end
end
