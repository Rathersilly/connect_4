# frozen_string_literal: true

require 'colorize'
require './player.rb'
require './board.rb'
BOARD_ROWS = 6
BOARD_COLS = 7
P1_TOKEN = 'X'
P2_TOKEN = 'O'
TITLE = '
_________                                     __       _____  
\_   ___ \  ____   ____   ____   ____   _____/  |_    /  |  | 
/    \  \/ /  _ \ /    \ /    \_/ __ \_/ ___\   __\  /   |  |_
\     \___(  <_> )   |  \   |  \  ___/\  \___|  |   /    ^   /
 \______  /\____/|___|  /___|  /\___  >\___  >__|   \____   | 
        \/            \/     \/     \/     \/            |__| '

class Game
  # @@games_played = 0

  def initialize
    @board = Board.new(BOARD_ROWS, BOARD_COLS)
    puts TITLE
    @players = { p1: Player.new(''), p2: Player.new('') }
    player_setup
    @board.draw
    game_loop
  end

  def player_setup
    puts "What is player 1's name: "
    @players[:p1].name = gets.chomp
    if @players[:p1].name == ''
      print "\e[F"
      puts 'Alice'
      @players[:p1].name = 'Alice' 
    end
    @players[:p1].token = P1_TOKEN
    puts "What is player 2's name: "
    @players[:p2].name = gets.chomp
    if @players[:p2].name == ''
      print "\e[F"
      puts 'Bob'
      @players[:p2].name = 'Bob' 
    end
    @players[:p2].token = P2_TOKEN
    #sleep 1
    print "\e[4F\e[J"
    print "\n\n       #{@players[:p1].name.upcase} vs #{@players[:p2].name.upcase}\n\n"  
  end

  def game_loop
    moves = 0
    current_player = nil
    loop do
      puts "moves: #{moves}"
      current_player = moves.even? ? :p1 : :p2

      take_turn(current_player)
      break if @board.game_over?

      print "\e[12F"
      print "\e[J"
      @board.draw

      moves += 1

      break if moves > 20
    end

    print "\e[13F"
    print "\e[J"
    @board.draw
    print "\n          ", @players[current_player].name, " wins!\n"
  end

  def take_turn(player_sym)
    print @players[player_sym].name, "'s turn.  Press Column #\n"
    move = gets.chomp
    puts 'Please Press Column #'
    puts "move = #{move}"
    ok_move = false
    case move
    when /^q/
      exit
    when /^e/
      filename = move[2..-1]
      @board.export(filename)
      ok_move = true
    when /^i/
      filename = move[2..-1]
      @board.import(filename)
      ok_move = true
    when 'h'
      @board.test_horiz
    when 'v'
      @board.test_vert
    when 'du'
      @board.test_diag_up
    when 'dd'
      @board.test_diag_down
    when /\d/
      ok_move = @board.insert(move.to_i, @players[player_sym].token)
    end

    if ok_move == false
      print "\e[5F\e[J"
      puts 'Invalid move.'
      take_turn(player_sym)
    end
  end
end
Game.new
