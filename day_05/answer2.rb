# https://adventofcode.com/2021/day/5

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true)

x, y = 0, 1

lines = inputs.map { |input|
  # 721,865 -> 170,314
  from, to = input.split("->").map { _1.split(",").map(&:to_i) }.sort
  [from, to]
}

from, to = 0, 1
max_x = lines.max_by { |from, to| to[x] }[to][x] + 1
max_y = lines.max_by { |from, to| to[y] }[to][y] + 1
@board = Array.new(max_y) { Array.new(max_x, 0) }

puts "#{max_x}X#{max_y} board created"

# lines.each { puts _1.to_s }
lines.each do |line|
  distance = [line[to][x] - line[from][x], line[to][y] - line[from][y]].max + 1

  # puts line.to_s
  distance.times do |i|
    px = line[from][x] != line[to][x] ? line[from][x] + i : line[from][x]
    py = line[from][y] != line[to][y] ? line[from][y] + i * (line[to][y] > line[from][y] ? 1 : -1) : line[from][y]
    # puts [px, py].to_s
    @board[py][px] += 1
  end
end

puts @board.sum { _1.count { |occurance| occurance >= 2 } }