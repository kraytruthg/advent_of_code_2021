# https://adventofcode.com/2021/day/7

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true).first.split(",").map(&:to_i).tally

min = nil
keys = inputs.keys.sort
(keys.first..keys.last).to_a.each do |target|
  distance = inputs.sum do |(num, count)|
    steps = (num - target).abs
    (1+steps)*steps/2 * count
  end
  # puts "target: #{target}, distance: #{distance}"

  if min.nil? || min > distance
    min = distance
  end
end

puts min