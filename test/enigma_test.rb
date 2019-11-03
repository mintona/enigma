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
  end

  def test_it_can_get_shift_with_key_and_date


  end

  def test_it_can_shift_characters
    assert_equal '', @enigma.shift("Lets TRY this AGAIN!!")
  end

  def test_it_can_encrypt_a_message
    skip
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
end
