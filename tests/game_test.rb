require 'minitest/autorun'
require 'minitest/pride'
require '../lib/game'

class Game < Minitest::Test
  context 'evaluate_guess' do
    setup do
      @current_game = Game.new
    end

    should 'return perfect matches' do
      assert_equal ["G","G"], @current_game.evaluate_guess(gggr)
    end

    should 'return partial matches' do
      skip
      assert_equal ["G",], @current_game.evaluate_guess(gggr)
    end




  end
end
