# https://adventofcode.com/2021/day/8

class Checker
  attr_reader :input

  PATTERN = {
    "[" => "]",
    "{" => "}",
    "(" => ")",
    "<" => ">"
  }
  def initialize(input)
    @input = input
  end

  def illegal_at
    @illegal_at ||= begin
      matched = []
      input.find do |c|
        # puts "char: #{c}, matched: #{matched}"
        if PATTERN[c]
          matched.unshift(PATTERN[c])
          false
        else
          c != matched.shift
        end
      end
    end
  end

  def score
    case illegal_at
    when ")"
      3
    when "]"
      57
    when "}"
      1197
    when ">"
      25137
    else
      0
    end
  end
end

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true).map { _1.split("") }

puts inputs.sum { |input| Checker.new(input).score }