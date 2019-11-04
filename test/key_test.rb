require './test/test_helper'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_generate_random_five_digit_number
    number1 = Key.generate_number

    assert_equal 5, number1.length

    number2 = Key.generate_number

    assert_equal 5, number2.length

    number3 = Key.generate_number

    assert_equal 5, number3.length

    expected = number1 != number2 && number2 != number3 && number1 != number3
    #should this be tested more? this will be a problem if it ever generates the same number twice
    #seems super unlikely
    assert_equal true, expected
  end

  def test_it_can_start_with_zero
    Key.expects(:rand).returns(1234)

    assert_equal "01234", Key.generate_number

    Key.expects(:rand).returns(234)

    assert_equal "00234", Key.generate_number
  end

end
