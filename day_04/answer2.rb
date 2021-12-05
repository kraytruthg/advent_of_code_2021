# https://adventofcode.com/2021/day/4


class Bingo
  BOARD_SIZE = 5

  attr_reader :board, :score

  def initialize(board)
    @board = board
    @score = nil

    puts "board created"
    board.each { puts _1.to_s }
  end

  def bingo(number)
    return if score

    board.each do |line|
      next unless index = line.index(number)
      line[index] = nil
    end

    @score = sum_of_remaining * number.to_i if bingo?
  end

  private

  def bingo?
    board.any? { _1.all?(&:nil?) } || board.transpose.any? { _1.all?(&:nil?) }
  end

  def sum_of_remaining
    board.sum { |line| line.sum(&:to_i) }
  end
end

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true)
inputs.delete("")
picks = inputs.shift.split(",")
boards = inputs.map { _1.split(" ") }.each_slice(Bingo::BOARD_SIZE).map { Bingo.new(_1) }

puts "========= Game start ========="
picks.each do |number|
  puts "pick #{number}"

  winners = boards.select { _1.bingo(number) }.each do |winner|
    puts "*** Win by #{winner.score} ***"
  end
  boards -= winners

  break if boards.empty?
end
