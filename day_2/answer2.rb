# https://adventofcode.com/2021/day/2

dir = File.dirname(__FILE__)
x, y = 0, 0
aim = 0

File.read("#{dir}/input").lines.map { _1.split(" ") }.each do |(command, value)|
  value = value.to_i

  case command
  when "forward"
    x += value
    y += aim * value
  when "down"
    aim += value
  when "up"
    aim -= value
  end
end

puts x * y