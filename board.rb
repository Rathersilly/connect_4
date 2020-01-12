# frozen_string_literal: true

require 'csv'

class Board
  attr_accessor :board, :rows, :cols
  def initialize(rows = 6, cols = 7)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, '-') }
  end

  def draw(array = @board)
    print '| '
    cols.times { |i| print i + 1, ' ' }
    print "|\n"
    rows.times do |x|
      print '| '
      cols.times do |y|
        print array[x][y], ' '
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
    # TODO: check if a win is possible for a board state
    draw(@board)
    return true if check_horizontal == true
    return true if check_vertical == true
    return true if check_diagonal_up == true
    return true if check_diagonal_down == true

    false
  end

  def check_horizontal(array = @board)
    (rows - 1).downto(0).each do |x|
      test_row = array[x].join
      next unless test_row =~ /(XXXX)/ || test_row =~ /(OOOO)/

      # test_row.sub!(Regexp.last_match(1), 'GGGG')
      #puts 'HORIZ WIN'
      @board[x] = test_row.split('')

      draw(@board)
      draw(array)
      puts "hihihi"
      return true
    end
    false
  end

  def check_vertical(array = @board)
    cols.times do |y|
      vertstring = ''
      rows.times do |x|
        vertstring += array[x][y] if array[x][y] != nil
        if vertstring =~ /(XXXX)/ || vertstring =~ /(OOOO)/
          #puts 'VERTICAL WIN!'
          return true
        end
      end
    end
    false
  end

  def check_diagonal_down(array = @board)
    diag_array = Array.new(6) { [] }

    rows.times do |x|
      diag_array[x] = array[x][x..-1]
    end

    check_vertical(diag_array)
  end

  def check_diagonal_up(array = @board)
    diag_array = Array.new(6) { [] }
    rows.times do |x|
      diag_array[rows - x - 1] = array[rows - x - 1][x..-1]
    end
    draw(diag_array)
    check_vertical(diag_array)
  end

  def legal_move?(col)
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
