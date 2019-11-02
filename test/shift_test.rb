require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @key = Key.new
    @key.expects(:generate_number).returns("12345")
    @key.set_keys

    date = Date.new(2019,11,2)
    @offset = Offset.new(date)
    @offset.set_offsets

    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_attributes
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
    assert_nil @shift.a_shift
    assert_nil @shift.b_shift
    assert_nil @shift.c_shift
    assert_nil @shift.d_shift
  end

  def test_it_can_create_shift
    @shift.create_shift

    assert_equal 14, @shift.a_shift
    assert_equal 24, @shift.b_shift
    assert_equal 40, @shift.c_shift
    assert_equal 46, @shift.d_shift
  end
end
