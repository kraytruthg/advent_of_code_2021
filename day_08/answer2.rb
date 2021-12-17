# https://adventofcode.com/2021/day/10

dir = File.dirname(__FILE__)
rows = File.readlines("#{dir}/input", chomp: true).map { _1.split("").map { |i| i == "9" ? nil : 1 } }

def adjacencies(x, y)
  [
    [x - 1, y], # up
    [x + 1, y], # down
    [x, y - 1], # left
    [x, y + 1]  # right
  ]
end

basins = []
rows.size.times do |y|
  rows[y].size.times do |x|
    next unless rows[y][x]
    puts [x, y].to_s
    rows[y][x] = nil
    space = 1
    targets = adjacencies(x, y)
    puts targets.to_s

    while targets.size > 0
      x1, y1 = targets.shift
      next unless y1 >= 0 && rows[y1] && x1 >= 0 && rows[y1][x1]
      rows[y1][x1] = nil
      space += 1
      targets += adjacencies(x1, y1)
    end

    basins << space
  end
end

puts basins.sort.last(3).reduce(&:*)