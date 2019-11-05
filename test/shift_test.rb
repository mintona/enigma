require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'
require_relative '../lib/shift'

class ShiftTest < Minitest::Test

  # def setup
  #   key = "02715"
  #   date = "040895"
  #   @shift = Shift.new(key, date)
  # end

  def test_it_exists
    shift = Shift.new#("12345", "021119")
    assert_instance_of Shift, shift
  end

  # def test_it_has_attributes
  #   assert_equal "02715", @shift.key
  #   assert_equal "040895", @shift.date
  #   assert_equal ({}), @shift.shift_values
  #   # assert_nil @shift.a_shift
  #   # assert_nil @shift.b_shift
  #   # assert_nil @shift.c_shift
  #   # assert_nil @shift.d_shift
  # end

  def test_it_can_create_offset
    assert_equal "1025", Shift.create_offset("040895")
  end

  def test_it_can_create_offset_using_todays_date
    Date.expects(:generate_date).returns(Date.new(1995,8,4))

    assert_equal "1025", Shift.create_offset
  end

  def test_it_can_create_shift

    Shift.create_shift("02715", "040895")

    expected = {:a_shift=>3, :b_shift=>27, :c_shift=>73, :d_shift=>20}
    assert_equal expected, Shift.create_shift("02715", "040895")

    # assert_equal 3, @shift.shift_values[:a_shift]
    # assert_equal 27, @shift.shift_values[:b_shift]
    # assert_equal 73, @shift.shift_values[:c_shift]
    # assert_equal 20, @shift.shift_values[:d_shift]

    # assert_equal 3, @shift.a_shift
    # assert_equal 27, @shift.b_shift
    # assert_equal 73, @shift.c_shift
    # assert_equal 20, @shift.d_shift
  end

end
