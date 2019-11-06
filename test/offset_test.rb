require './test/test_helper'
require_relative '../lib/key'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test
  def setup
    @date = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @date
  end

  def test_it_can_get_todays_date
    Date.expects(:today).returns(Date.new(2019,11,2))

    assert_equal "021119", Offset.generate_date
  end

  def test_it_converts_date_to_six_character_string_format
    Date.expects(:today).returns(Date.new(2019,11,2))

    date = Offset.generate_date

    assert_equal true, date.class == String
    assert_equal 6, date.length
  end

  def test_it_uses_only_numbers_in_string
    Date.expects(:today).returns(Date.new(2019,11,2))

    date_1 = Offset.generate_date
    date_2 = "1/2/19"

    expected_1 = date_1.to_i.digits.length >= 3
    expected_2 = date_2.to_i.digits.length < 3

    assert_equal true, expected_1
    assert_equal true, expected_2
  end

end
