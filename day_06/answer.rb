# https://adventofcode.com/2021/day/6

dir = File.dirname(__FILE__)
fishs = File.readlines("#{dir}/input", chomp: true).first.split(",").map(&:to_i)

DAYS = 80

DAYS.times do |i|
  new_fishs = 0
  fishs.size.times do |index|
    fishs[index] -= 1
    if fishs[index] < 0
      fishs[index] = 6
      fishs << 8
    end
  end

  # puts "Day #{i + 1}, #{fishs.to_s}"
end
puts fishs.size