# frozen_string_literal: true

class Board
  attr_accessor :board_state, :rows, :cols
  def initialize(rows, cols)
    @board_state = Array.new(rows, '-') { Array.new(cols, '-') }
    @rows = rows
    @cols = cols
  end

  def draw
    print '| '
    cols.times { |i| print i + 1, ' ' }
    print "|\n"
    rows.times do |x|
      print '| '
      cols.times do |y|
        print @board_state[x][y], ' '
      end
      print "|\n" # =>
    end
  end
  def insert(col, sym)

  end

  def legal_move?(col)
  end

end
