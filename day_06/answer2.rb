# https://adventofcode.com/2021/day/6

dir = File.dirname(__FILE__)
group = File.readlines("#{dir}/input", chomp: true).first.split(",").map(&:to_i).tally

DAYS = 256
puts group.to_s

def growth(group)
  result = {}
  group.each do |timer, count|
    if timer > 0
      result[timer - 1] = result[timer - 1].to_i + count
    else
      result[6] = result[6].to_i + count
      result[8] = result[8].to_i + count
    end
  end
  result
end

DAYS.times do |i|
  group = growth(group)
end

puts group.values.sum