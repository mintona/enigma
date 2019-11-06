require './test/test_helper'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_it_can_generate_random_five_digit_number_as_a_string
    number_1 = Key.generate_number
    assert_equal 5, number_1.length

    number_2 = Key.generate_number
    assert_equal 5, number_2.length

    number_3 = Key.generate_number
    assert_equal 5, number_3.length

    expected_1 = number_1 != number_2 && number_2 != number_3 && number_1 != number_3
    assert_equal true, expected_1

    expected_2 = [number_1, number_2, number_3].all? { |number| number.class == String }
    assert_equal true, expected_2
  end

  def test_it_can_start_with_zero
    Key.expects(:rand).returns(1234)
    assert_equal "01234", Key.generate_number

    Key.expects(:rand).returns(234)
    assert_equal "00234", Key.generate_number
  end

end
