# https://adventofcode.com/2021/day/5

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true)

x, y = 0, 1

lines = inputs.map { |input|
  # 721,865 -> 170,314
  from, to = input.split("->").map { _1.split(",").map(&:to_i) }.sort
  [from, to]
}.select { |(from, to)| from[x] == to[x] || from[y] == to[y] }

from, to = 0, 1
max_x = lines.max_by { |from, to| to[x] }[to][x] + 1
max_y = lines.max_by { |from, to| to[y] }[to][y] + 1
@board = Array.new(max_y) { Array.new(max_x, 0) }

puts "#{max_x}X#{max_y} board created"

# lines.each { puts _1.to_s }
lines.each do |line|
  xs = (line[from][x]..line[to][x]).to_a.each do |px|
    ys = (line[from][y]..line[to][y]).to_a.each do |py|
      @board[py][px] += 1
    end
  end
end

puts @board.sum { _1.count { |occurance| occurance >= 2 } }