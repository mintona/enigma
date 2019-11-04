require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test

  def setup
    key = "02715"
    date = "040895"
    @shift = Shift.new(key, date)
  end

  def test_it_exists
    shift = Shift.new("12345", "021119")
    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    assert_equal "02715", @shift.key
    assert_equal "040895", @shift.date
    assert_nil @shift.a_shift
    assert_nil @shift.b_shift
    assert_nil @shift.c_shift
    assert_nil @shift.d_shift
  end

  def test_it_can_create_offset
    assert_equal "1025", @shift.create_offset
  end

  def test_it_can_create_shift

    @shift.create_shift
    assert_equal 3, @shift.a_shift
    assert_equal 27, @shift.b_shift
    assert_equal 73, @shift.c_shift
    assert_equal 20, @shift.d_shift
  end

end
