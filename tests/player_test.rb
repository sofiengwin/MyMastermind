require 'minitest/autorun'
require 'minitest/pride'
require '../lib/file'

class Player < Minitest::Test
  def initialize
    @current_player = Player.new("James Franco", 1)
  end

  def class_exits
    assert Player
  end

  def check_user_name
    assert_equal "James Franco", @current_player.name
  end

  def check_user_level
    assert_equal 1, @current_player.level
  end
end
