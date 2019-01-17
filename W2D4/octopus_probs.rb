def sluggish_octopus(fish_lengths)
  max = ""

  i = 0
  while i < fish_lengths.length - 1
    j = i + 1
    while j < fish_lengths.length
      el1 = fish_lengths[i]
      el2 = fish_lengths[j]

      if el1.length > el2.length && el1.length > max.length
        max = el
      elsif el2.length > max.length
        max = el2
      end

      j += 1
    end

    i += 1
  end

  max
end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return self if count <= 1

    mid = self.count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def merged(left, right, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    result = []

    until left.empty? || right.empty?
      if right.first < left.first
        merged << right.shift
      else
        merged << left.shift
      end
    end

    result + left + right
  end
end


def dominant_octopus(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }

  fishes.merge_sort(&prc).first
end

def clever_octopus(fishes)
  biggest = fishes.first

  fishes.each do |fish|
    biggest = fish if fish.length > biggest.length
  end

  biggest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end