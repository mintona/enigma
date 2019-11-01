require './test/test_helper'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def setup
    #it will need an argument of a 5 digit number
    @random_number = 12345
    @key = Key.new(@random_number)
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal 12, @key.a_key
    assert_equal 23, @key.b_key
    assert_equal 34, @key.c_key
    assert_equal 45, @key.d_key
  end

  def test_it_has_5_digits
    skip
    assert_equal true, @key.five_digits?
  end
end
