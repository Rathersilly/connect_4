# frozen_string_literal: true

# draw board
# first player moves by selecting column
# second player moves
# check for winner

# should probably have a board class with each

require 'colorize'
BOARD_ROWS = 6
BOARD_COLS = 7
# INITIAL_BOARD = Array.new(BOARD_ROWS, '-') { Array.new(BOARD_COLS, '-') }

class Player
  attr_accessor :name, :token
  def initialize(name)
    @name = name
  end
end

class Game
  # @@games_played = 0
  @board = []

  def initialize
    @board = Array.new(BOARD_ROWS, '-') { Array.new(BOARD_COLS, '-') }
    puts 'Time for Connect 4'
    @players = { p1: Player.new(''), p2: Player.new('') }
    player_setup
    draw_board
    game_loop
  end

  def player_setup
    p @players
    puts "What is player 1's name: "
    @players[:p1].name = gets.chomp
    @players[:p1].token = 'X'
    puts "What is player 2's name: "
    @players[:p2].name = gets.chomp
    @players[:p2].token = 'O'
  end

  def draw_board
    print '| '
    BOARD_COLS.times { |i| print i + 1, ' ' }
    print "|\n"
    BOARD_ROWS.times do |x|
      print '| '
      BOARD_COLS.times do |y|
        print @board[x][y], ' '
      end
      print "|\n"
    end
  end

  def game_loop
    moves = 0
    current_player = nil
    loop do
      puts "moves: #{moves}"
      current_player = if moves.even?
                         :p1
                       else
                         :p2
                       end

      p current_player
      take_turn(current_player)
      draw_board

      moves += 1

      break if moves > 10
      break if game_over?
    end

    print current_player, " wins!\n"
  end

  def take_turn(player)
    p player
    print @players[player].name, "'s turn.  Press Column #\n"

    move = gets.chomp.to_i
    #  break if (1..BOARD_COLS).include?(move)
    puts 'Please Press Column #'

    puts "move = #{move}"
    # search through that col from the bottom and put the players token in the first free row
    # if there is no free row, retake turn
    moveflag = false
    BOARD_ROWS.times do |x|
      draw_board
      pos = @board[BOARD_ROWS - x - 1][move - 1]
      puts pos
      next unless pos == '-'

      @board[BOARD_ROWS - x - 1][move - 1] = @players[player].token
      moveflag = true
      break
    end
    if moveflag == false
      puts 'invalid move'
      take_turn(player)
    end
  end

  def game_over?
    # check horizontal
    BOARD_ROWS.times do |x|
      new_row = @board[x].join
      next unless @board[x].join =~ /(XXXX)/ || @board[x].join =~ /(OOOO)/

      new_row.sub!(Regexp.last_match(1), 'GGGG')
      puts new_row
      puts 'HORIZ WIN'
      @board[x] = new_row.split('')
      p @board[x]
      draw_board

      return true
    end

    # vertical adds board  0
    BOARD_COLS.times do |y|
      vertstring = ''
      BOARD_ROWS.times do |x|
        vertstring += @board[x][y]
        if vertstring =~ /(XXXX)/ || vertstring =~ /(OOOO)/
          puts 'VERTICAL WIN!'
          return true
        end
      end
    end

    return false

  end
end
Game.new

# >> [["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"], ["-", "-", "-", "-", "-", "-", "-"]]
# >> nil

# ~> NoMethodError
# ~> undefined method `each' for nil:NilClass
# ~>
# ~> /tmp/seeing_is_believing_temp_dir20191231-14005-8kai5g/program.rb:30:in `draw_board'  # =>
# ~> /tmp/seeing_is_believing_temp_dir20191231-14005-8kai5g/program.rb:40:in `<main>'
