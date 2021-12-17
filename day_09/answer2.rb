# https://adventofcode.com/2021/day/8


# 0:      1:      2:      3:      4:
# aaaa    ....    aaaa    aaaa    ....
# b    c  .    c  .    c  .    c  b    c
# b    c  .    c  .    c  .    c  b    c
# ....    ....    dddd    dddd    dddd
# e    f  .    f  e    .  .    f  .    f
# e    f  .    f  e    .  .    f  .    f
# gggg    ....    gggg    gggg    ....

#  5:      6:      7:      8:      9:
# aaaa    aaaa    aaaa    aaaa    aaaa
# b    .  b    .  .    c  b    c  b    c
# b    .  b    .  .    c  b    c  b    c
# dddd    dddd    ....    dddd    dddd
# .    f  e    f  .    f  e    f  .    f
# .    f  e    f  .    f  e    f  .    f
# gggg    gggg    ....    gggg    gggg

PATTERN = {
  [:b, :bl, :br, :t, :tl, :tr]=>"0",
  [:br, :tr]=>"1",
  [:b, :bl, :c, :t, :tr]=>"2",
  [:b, :br, :c, :t, :tr]=>"3",
  [:br, :c, :tl, :tr]=>"4",
  [:b, :br, :c, :t, :tl]=>"5",
  [:b, :bl, :br, :c, :t, :tl]=>"6",
  [:br, :t, :tr]=>"7",
  [:b, :bl, :br, :c, :t, :tl, :tr]=>"8",
  [:b, :br, :c, :t, :tl, :tr]=>"9"
}

def position_mapping(strs)
  # strs => ["be", "cfbegad", "cbdgef", "fgaecd", "cgeb", "fdcge", "agebfd", "fecdb", "fabcd", "edb"]
  str_arr = strs.map { _1.split("") }
  str_by_occurance = str_arr.flatten.tally

  mapping = {}

  mapping[:bl] = str_by_occurance.index(4)
  mapping[:tl] = str_by_occurance.index(6)
  mapping[:br] = str_by_occurance.index(9)
  mapping[:t] = (str_arr.find { _1.size == 3 } - str_arr.find { _1.size == 2 }).first
  mapping[:tr] = str_arr.find { _1.size == 2 }.find { _1 != mapping[:br] }
  mapping[:c] = str_arr.find { _1.size == 4 }.find { ![mapping[:tl], mapping[:tr], mapping[:br]].include?(_1) }
  mapping[:b] = (("a".."g").to_a - mapping.values).first

  mapping
end

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true)

converted = inputs.map do |line|
  # line => be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
  clues, _, target = line.partition('| ')

  pattern = position_mapping(clues.split(" "))
  puts pattern
  target.split(" ").map do |encode_str|
    # fcgde -> convert to number and sum it up
    key = encode_str.split("").map { pattern.index(_1) }.sort
    puts [encode_str, key, PATTERN[key]]

    PATTERN[key]
  end.reduce(&:+)
end

converted.each { puts _1 }
puts converted.sum { _1.to_i }