require './test/test_helper'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_nil @key.a_key
    assert_nil @key.b_key
    assert_nil @key.c_key
    assert_nil @key.d_key
  end

  def test_it_can_generate_random_five_digit_number
    number1 = @key.generate_number

    assert_equal 5, number1.length

    number2 = @key.generate_number

    assert_equal 5, number2.length

    number3 = @key.generate_number

    assert_equal 5, number3.length

    expected = number1 != number2 && number2 != number3 && number1 != number3
    #should this be tested more? this will be a problem if it ever generates the same number twice
    #seems super unlikely
    assert_equal true, expected
  end

  def test_it_can_set_the_keys
    @key.expects(:generate_number).returns("12345")
    @key.set_keys

    assert_equal '12', @key.a_key
    assert_equal '23', @key.b_key
    assert_equal '34', @key.c_key
    assert_equal '45', @key.d_key
  end

end
