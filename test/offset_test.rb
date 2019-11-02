require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes
    #probably a better way to use a mock here?

    assert_instance_of Date, @offset.date
    assert_nil @offset.a_offset
    assert_nil @offset.b_offset
    assert_nil @offset.c_offset
    assert_nil @offset.d_offset
  end



  def test_it_can_be_given_a_date
    date = Date.new(1979,10,31)

    offset = Offset.new(date)

    assert_equal date, offset.date
  end

  def test_it_can_convert_dates_to_strings
    date = Date.new(1979,10,31)
    offset = Offset.new(date)

    assert_equal "311079", offset.date_to_string

    #def come back to this to try to stub 11/2/2019 as todays date in all testing

  #  date.expects(:date).returns(Date.new(2019,11,2))
    assert_equal "021119", @offset.date_to_string
  end

  def test_it_can_get_last_four_digits
    @offset.expects(:date_to_string).returns("311019")

    assert_equal "8361", @offset.last_four
  end

  def test_it_can_set_offsets
    @offset.expects(:date_to_string).returns("311019")
    #311019 * 311019 = 96732818361
    #last 4 = 8361
    @offset.set_offsets

    assert_equal "8", @offset.a_offset
    assert_equal "3", @offset.b_offset
    assert_equal "6", @offset.c_offset
    assert_equal "1", @offset.d_offset
  end

end
