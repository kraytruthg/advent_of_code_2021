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

  def completion
    @completion ||= begin
      matched = []
      input.each do |c|
        # puts "char: #{c}, matched: #{matched}"
        if PATTERN[c]
          matched.unshift(PATTERN[c])
        elsif c != matched.shift
          matched = []
          break
        end
      end
      matched
    end
  end

  def score
    score = 0
    completion.each do |c|
      score = score * 5 + value(c)
    end
    score
  end

  def value(c)
    case c
    when ")"
      1
    when "]"
      2
    when "}"
      3
    when ">"
      4
    end
  end
end

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true).map { _1.split("") }

scores = inputs.map { Checker.new(_1).score }.select(&:positive?).sort
puts scores[scores.size / 2]