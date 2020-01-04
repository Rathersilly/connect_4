require './board.rb'
#require 'rspec'

describe Board do


  describe '#initialize' do
    it "contains 6x7 grid of '-'" do
      expect(Board.board).to eq(Array.new(6, '-') { Array.new(7, '-') })
    end
  end
end


