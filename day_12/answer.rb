# https://adventofcode.com/2021/day/12

#     start
#     /   \
# c--A-----b--d
#     \   /
#      end

# start,A,b,A,c,A,end
# start,A,b,A,end
# start,A,b,end
# start,A,c,A,b,A,end
# start,A,c,A,b,end
# start,A,c,A,end
# start,A,end
# start,b,A,c,A,end
# start,b,A,end
# start,b,end

# start: [A, b]
# A: [c, b, end]
# b: [A, d, end]
# c: [A]
# d: [b]

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true).map { _1.split("-") }

puts "Build connections..."
connections = { "end" => [] }

inputs.each do |link|
  [link, link.reverse].each do |(from, to)|
    next if from == "end" || to == "start"

    connections[from] ||= []
    connections[from] << to
  end
end

# connections.keys.each do |key|
#   puts "#{key}: #{connections[key]}}"
# end

puts "Calculate possible paths..."
paths = [ "start" ]

paths.each do |path|
  links = path.split(".")
  connections[links.last].each do |connection|
    next if connection.downcase == connection && links.include?(connection)

    new_path = path + ".#{connection}"
    # puts "#{path} => #{new_path}"
    paths << new_path
  end
end

# paths.each { puts _1 }

puts "Find valid routes"
puts paths.count { _1.end_with?("end") }