# https://adventofcode.com/2021/day/1

dir = File.dirname(__FILE__)

count = File.read("#{dir}/input").lines.map(&:to_i).each_cons(2).count { |(previous, current)|
  current > previous
}
puts count