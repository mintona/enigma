require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @key = "02715"
    @date = "040895"
  end

  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_it_can_create_offset
    assert_equal "1025", Shift.create_offset(@date)
  end

  def test_it_can_split_key
    expected = [2, 27, 71, 15]
    assert_equal expected, Shift.split_key(@key)
  end

  def test_it_can_create_shift
    expected = [3, 27, 73, 20]

    assert_equal expected, Shift.create_shift(@key, @date)
  end
end
