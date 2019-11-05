require './test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/shift'
require_relative '../lib/offset'
require_relative '../lib/key'

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

    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date

    assert_equal 3, @enigma.shift.a_shift
    assert_equal 27, @enigma.shift.b_shift
    assert_equal 73, @enigma.shift.c_shift
    assert_equal 20, @enigma.shift.d_shift
  end

  def test_it_can_create_shift_with_key_only
    Date.expects(:today).returns(Date.new(2019,11,2))
#offset should = "021119"
    @enigma.create_shift("02715")

    assert_equal "02715", @enigma.key
    assert_equal "021119", @enigma.date

    assert_equal 4, @enigma.shift.a_shift
    assert_equal 28, @enigma.shift.b_shift
    assert_equal 77, @enigma.shift.c_shift
    assert_equal 16, @enigma.shift.d_shift
  end

  def test_it_can_create_shift_without_key_or_date
    Date.expects(:today).returns(Date.new(2019,11,2))
    Key.expects(:generate_number).returns("12345")

    @enigma.create_shift

    assert_equal "12345", @enigma.key
    assert_equal "021119", @enigma.date

    assert_equal 14, @enigma.shift.a_shift
    assert_equal 24, @enigma.shift.b_shift
    assert_equal 40, @enigma.shift.c_shift
    assert_equal 46, @enigma.shift.d_shift
  end

  def test_it_can_determine_shift_amount_by_character
    @enigma.create_shift("02715", "040895")

    assert_equal @enigma.shift.a_shift, @enigma.determine_shift_amount(0)
    assert_equal @enigma.shift.b_shift, @enigma.determine_shift_amount(1)
    assert_equal @enigma.shift.c_shift, @enigma.determine_shift_amount(2)
    assert_equal @enigma.shift.d_shift, @enigma.determine_shift_amount(3)
  end

  def test_it_can_determine_if_character_is_in_alphabet
    assert_equal true, @enigma.in_alphabet?("a")
    assert_equal true, @enigma.in_alphabet?("h")
    assert_equal true, @enigma.in_alphabet?(" ")
    assert_equal true, @enigma.in_alphabet?("Z")
    assert_equal false, @enigma.in_alphabet?("?")
    assert_equal false, @enigma.in_alphabet?("!")
  end

  def test_it_can_find_alphabet_index_of_character
    assert_equal 0, @enigma.alphabet_index("a")
    assert_equal 12, @enigma.alphabet_index("M")
    assert_equal 26, @enigma.alphabet_index(" ")
  end

  def test_it_can_shift_alphabet_a_given_amount
    assert_equal 0, @enigma.alphabet_index("a")
    rotated_alphabet = @enigma.shift_alphabet(3)
    expected = rotated_alphabet.find_index("d")
    assert_equal 0, expected

    assert_equal 0, @enigma.alphabet_index("a")
    rotated_alphabet = @enigma.shift_alphabet(-3)
    expected = rotated_alphabet.find_index("y")
    assert_equal 0, expected
  end

  def test_it_can_shift_characters

    @enigma.create_shift("02715", "040895")
    #mock/stub here?

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

  def it_can_unshift_message(message)
    @enigma.create_shift("02715", "040895")

    assert_equal "hello world", @enigma.unshift_message("keder ohulw")
    assert_equal "hello world!", @enigma.unshift_message("keder ohulw!")
    assert_equal "!hello world?", @enigma.unshift_message("!keder ohulw?")
  end


  def test_it_can_decrypt_a_message
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_key_only
    Date.expects(:today).returns(Date.new(1995,8,4))

    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_key_only
    Date.expects(:today).at_least_once.returns(Date.new(1995,8,4))

    encrypted = @enigma.encrypt("hello world", "02715")

    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_a_message_without_key_or_date
    Date.expects(:today).returns(Date.new(1995,8,4))
    Key.expects(:generate_number).returns("02715")

    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world")
  end

#this next test might be totally bogus
  def test_it_can_decrypt_a_message_without_key_or_date
    Date.expects(:today).at_least_once.returns(Date.new(1995,8,4))
    Key.expects(:generate_number).at_least_once.returns("02715")

    encrypted = @enigma.encrypt("hello world")

    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @enigma.decrypt(encrypted[:encryption])
  end
end
