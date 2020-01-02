# frozen_string_literal: true

# draw board
# first player moves by selecting column
# second player moves
# check for winner

# should probably have a board class with each

require 'colorize'
require './player.rb'
require './board.rb'
BOARD_ROWS = 6
BOARD_COLS = 7
P1_TOKEN = "X"
P2_TOKEN = "O"
# INITIAL_BOARD = Array.new(BOARD_ROWS, '-') { Array.new(BOARD_COLS, '-') }


class Game
  # @@games_played = 0

  def initialize
    @board = Board.new(BOARD_ROWS, BOARD_COLS)
    puts 'Time for Connect 4'
    @players = { p1: Player.new(''), p2: Player.new('') }
    player_setup
    @board.draw
    game_loop
  end

  def player_setup
    p @players
    puts "What is player 1's name: "
    @players[:p1].name = gets.chomp
    @players[:p1].token = P1_TOKEN
    puts "What is player 2's name: "
    @players[:p2].name = gets.chomp
    @players[:p2].token = P2_TOKEN
  end


  def game_loop
    moves = 0
    current_player = nil
    loop do
      puts "moves: #{moves}"
      current_player = moves.even? ?  :p1 : :p2

      p current_player
      take_turn(current_player)
      @board.draw

      moves += 1

      break if moves > 10
      break if game_over?
    end

    print current_player, " wins!\n"
  end

  def take_turn(player)
    print @players[player].name, "'s turn.  Press Column #\n"

    move = gets.chomp.to_i
    #  break if (1..BOARD_COLS).include?(move)
    puts 'Please Press Column #'

    puts "move = #{move}"
    # search through that col from the bottom and put the players token in the first free row
    # if there is no free row, retake turn
    moveflag = false
    BOARD_ROWS.times do |x|
      @board.draw
      pos = @board.board_state[BOARD_ROWS - x - 1][move - 1]
      puts pos
      next unless pos == '-'

      @board.board_state[BOARD_ROWS - x - 1][move - 1] = @players[player].token
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
      new_row = @board.board_state[x].join
      next unless @board.board_state[x].join =~ /(XXXX)/ || @board.board_state[x].join =~ /(OOOO)/

      new_row.sub!(Regexp.last_match(1), 'GGGG')
      puts new_row
      puts 'HORIZ WIN'
      @board.board_state[x] = new_row.split('')
      p @board.board_state[x]
      @board.draw

      return true
    end

    # vertical adds board  0
    BOARD_COLS.times do |y|
      vertstring = ''
      BOARD_ROWS.times do |x|
        vertstring += @board.board_state[x][y]
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
