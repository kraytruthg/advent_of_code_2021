# https://adventofcode.com/2021/day/2

dir = File.dirname(__FILE__)
x, y = 0, 0

File.read("#{dir}/input").lines.map { _1.split(" ") }.each do |(command, value)|
  case command
  when "forward"
    x += value.to_i
  when "down"
    y += value.to_i
  when "up"
    y -= value.to_i
  end
end

puts x * y