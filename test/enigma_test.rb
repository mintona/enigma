require './test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/shift'

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

  def test_it_can_create_shift_with_key_and_date

    @enigma.create_shift("02715", "040895")

    assert_equal 3, @enigma.shift.a_shift
    assert_equal 27, @enigma.shift.b_shift
    assert_equal 73, @enigma.shift.c_shift
    assert_equal 20, @enigma.shift.d_shift
  end

  def test_it_can_shift_characters

    @enigma.create_shift("02715", "040895")

    assert_equal 'keder ohulw', @enigma.shift_message("hello world")
    assert_equal 'keder ohulw', @enigma.shift_message("HELLO WORLD")
    assert_equal 'keder ohulw!', @enigma.shift_message("hello world!")
  end

  def test_it_can_encrypt_a_message
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end


end
