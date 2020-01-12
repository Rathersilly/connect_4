# frozen_string_literal: true
#
# TODO check random boards
# some things i noticed: if check_vertical found a win in first column,
# it wouldnt check further columns, which could have a nil value due to
# the diagonal array checker

require './board.rb'
require 'csv'
# require 'rspec'
diag_test = Array.new(6) do |x|
  7.times do |y|
  end
end



6.times do |x|
  7.times do |y|
  end
end

def import(filename)
  filename = 'test_boards/' + filename + '.csv'
  @board = CSV.read(filename)
end
describe Board do
  context 'determining if game is won' do
    let(:test_board) do
      Board.new

    end
    it 'determines 4 horizontally' do
      test_board.board = import('horiz')
      expect(test_board.check_horizontal).to eq(true)
    end
    it 'determines 4 vertically' do
      test_board.board = import('vert')
      expect(test_board.check_vertical).to eq(true)
    end
    it 'determines 4 diagonally down' do
      test_board.board = import('diagtest')
      test_board.draw

      expect(test_board.check_diagonal_down).to eq(true)
    end
    it 'determines 4 diagonally up' do
      test_board.board = import('diagtest')
      expect(test_board.check_diagonal_up).to eq(true)
    end
  end
end
