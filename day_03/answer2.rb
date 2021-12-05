# https://adventofcode.com/2021/day/3

dir = File.dirname(__FILE__)

inputs = File.readlines("#{dir}/input", chomp: true).map { _1.split("") }
temp = inputs.dup
inputs.first.size.times do |index|
  selector = temp.map { _1[index] }.count("1") >= temp.size/2.to_f ? "1" : "0"
  temp.select! { _1[index] == selector }
  break if temp.size == 1
end

puts oxygen_generator_rating = temp.first.join.to_i(2)

temp = inputs.dup
inputs.first.size.times do |index|
  selector = temp.map { _1[index] }.count("1") >= temp.size/2.to_f ? "0" : "1"
  temp.select! { _1[index] == selector }
  break if temp.size == 1
end

puts co2_scrubber_rating = temp.first.join.to_i(2)
puts oxygen_generator_rating * co2_scrubber_rating