# https://adventofcode.com/2021/day/8

dir = File.dirname(__FILE__)
rows = File.readlines("#{dir}/input", chomp: true).map { _1.split("").map(&:to_i) }

lowest_points = []

rows.size.times do |y|
  rows[y].size.times do |x|
    current = rows[y][x]
    is_lowest = [
      [x - 1, y], # up
      [x + 1, y], # down
      [x, y - 1], # left
      [x, y + 1]  # right
    ].map do |(x, y)|
      y >= 0 && rows[y] && x >= 0 ? rows[y][x] : nil
    end.all? { |v| v.nil? || v > current }

    lowest_points << current if is_lowest
  end
end

puts lowest_points.to_s
puts lowest_points.reduce(0) { |sum, value| sum += value + 1}