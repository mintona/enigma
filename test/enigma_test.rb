require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_the_alphabet
    expected = ("a".."z").to_a << " "
    assert_equal expected, @enigma.alphabet
  end

  def test_it_has_a_key_and_date
    assert_nil @enigma.key
    assert_nil @enigma.date
    assert_nil @enigma.shift
  end

  def test_it_can_get_shift_with_key_and_date

    @enigma.create_shift("02715", "040895")

    assert_equal 3, @enigma.shift.a_shift
    assert_equal 27, @enigma.shift.b_shift
    assert_equal 73, @enigma.shift.c_shift
    assert_equal 20, @enigma.shift.d_shift
  end



  def test_it_can_shift_characters
    skip
    assert_equal '', @enigma.shift_message("Lets TRY this AGAIN!!")
  end

  def test_it_can_encrypt_a_message
    @enigma.expects(:shift.a_shift).returns(3)
    @enigma.expects(:shift.b_shift).returns(27)
    @enigma.expects(:shift.c_shift).returns(73)
    @enigma.expects(:shift.d_shift).returns(20)
    require "pry"; binding.pry
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
