require 'minitest/autorun'
require 'minitest/pride'
require '../lib/file'

class ReadFile < Minitest::Test
  def initialize
    @file_test = ReadFile.new
  end

  def class_exits
    assert ReadFile
  end

  def convert_time_to_string
    assert_equal "1: 0", @file_test.convert_time_to_string(60)
  end
end
