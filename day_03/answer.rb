# https://adventofcode.com/2021/day/3

dir = File.dirname(__FILE__)
gamma_rate_binary = ""
epsilon_rate_binary = ""

inputs = File.readlines("#{dir}/input", chomp: true)
size = inputs.size
inputs.map { _1.split("") }.transpose.each do |input|
  if input.count("0") > size/2.to_f
    gamma_rate_binary << "0"
    epsilon_rate_binary << "1"
  else
    gamma_rate_binary << "1"
    epsilon_rate_binary << "0"
  end
end

puts gamma_rate_binary.to_i(2) * epsilon_rate_binary.to_i(2)