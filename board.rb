# frozen_string_literal: true

require 'csv'

class Board
  attr_accessor :board, :rows, :cols
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, '-') }
  end

  def draw
    print '| '
    cols.times { |i| print i + 1, ' ' }
    print "|\n"
    rows.times do |x|
      print '| '
      cols.times do |y|
        print @board[x][y], ' '
      end
      print "|\n" # =>
    end
  end

  def insert(col, token)
    move = col
    moveflag = false
    rows.times do |i|
      pos = @board[rows - i - 1][move - 1]
      next unless pos == '-'

      @board[rows - i - 1][move - 1] = token
      moveflag = true
      break
    end
    moveflag
  end

  def game_over?
    return true if check_horizontal == true
    return true if check_vertical == true
    return true if check_diagonal_up == true
    return true if check_diagonal_down == true

    false
  end

  def check_horizontal
    (rows - 1).downto(0).each do |x|
      test_row = @board[x].join
      next unless test_row =~ /(XXXX)/ || test_row =~ /(OOOO)/

      # test_row.sub!(Regexp.last_match(1), 'GGGG')
      puts 'HORIZ WIN'
      @board[x] = test_row.split('')

      return true
    end
    false
  end

  def check_vertical
    cols.times do |y|
      vertstring = ''
      rows.times do |x|
        vertstring += @board[x][y]
        if vertstring =~ /(XXXX)/ || vertstring =~ /(OOOO)/
          puts 'VERTICAL WIN!'
          return true
        end
      end
    end
  end

  def check_diagonal_down
  end

  def check_diagonal_up
  end

  def legal_move?(col)
  end

  def test_horiz
    import('horiz')
  end

  def test_vert
    import('vert')
  end

  def test_diag_up
  end

  def test_diag_down
  end

  def export(filename)
    filename = 'test_boards/' + filename + '.csv'
    CSV.open(filename, 'w') do |csv|
      @board.each do |row|
        csv << row
      end
    end
  end

  def import(filename)
    filename = 'test_boards/' + filename + '.csv'
    @board = CSV.read(filename)
  end
end
