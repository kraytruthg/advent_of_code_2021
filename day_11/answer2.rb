# https://adventofcode.com/2021/day/8

class Board
  def initialize(board)
    @board = board
  end

  def step
    @board.each do |line|
      line.map! do |octopus|
        octopus += 1
      end
    end

    while @board.any? { |line| line.any? { |o| o && o > 9 } }
      @board.each_with_index do |line, y|
        line.each_with_index do |octopus, x|
          if octopus && octopus > 9
            @board[y][x] = nil
            flash_neighbors(x, y)
          end
        end
      end
    end

    return true if @board.flatten.all?(&:nil?)

    @board.each { |line| line.map! { |o| o.nil? ? 0 : o } }
    false
  end

  def flash_neighbors(x, y)
    (0..8).to_a.each do |i|
      next if i == 4 # current position

      row = y + i%3 - 1
      col = x + i/3 - 1

      if y_range.cover?(row) && x_range.cover?(col) && @board[row][col]
        @board[row][col] += 1
      end
    end
  end

  def x_range
    @x_range ||= (0..@board.first.size - 1)
  end

  def y_range
    @y_range ||= (0..@board.size - 1)
  end
end

dir = File.dirname(__FILE__)
inputs = File.readlines("#{dir}/input", chomp: true).map { _1.split("").map(&:to_i) }

board = Board.new(inputs)
i = 0
loop do
  i += 1
  break if board.step
end
puts i