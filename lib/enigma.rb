require 'date'
# require_relative './shift'
# require_relative './offset'
# require_relative './key'

class Enigma
  attr_reader :alphabet, :key, :date, :shift

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key = nil
    @date = nil
    @shift = nil
  end

  def create_shift(key = nil, date = nil)
    if key.nil? && date.nil?
      key = Key.generate_number
      date = Offset.generate_date
    elsif date.nil?
      date = Offset.generate_date
    end
    @key = key
    @date = date
    @shift = Shift.new(key, date)
    @shift.create_shift
  end

  def determine_shift_amount(index)
    if index % 4 == 0
      @shift.a_shift
    elsif index % 4 == 1
      @shift.b_shift
    elsif index % 4 == 2
      @shift.c_shift
    elsif index % 4 == 3
      @shift.d_shift
    end
  end

  def in_alphabet?(character)
    @alphabet.include?(character.downcase)
  end

  def alphabet_index(character)
    @alphabet.find_index(character.downcase)
  end

  def shift_alphabet(shift_amount)
    @alphabet.rotate(shift_amount)
  end

  def shift_message(message)
    message = message.downcase
    message_character_array = message.split('')

    new_characters = []
    #chain .map onto message_character_array.each_with_index.map do asldkfjasldkjf
    message_character_array.each_with_index do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = shift_alphabet(shift_amount)[alphabet_index(character)]
        new_characters << new_character
      else
        new_characters << character
      end
    end
    new_characters.join("")
  end

  def encrypt(message, key = nil, date = nil)
    create_shift(key, date)
    encrypted_message = shift_message(message)
    {
      encryption: "#{encrypted_message}",
      key: "#{@key}",
      date: "#{@date}"
    }
  end

  def unshift_message(message)
    message = message.downcase
    message_character_array = message.split('')

    new_characters = []
    message_character_array.each_with_index do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = shift_alphabet(-shift_amount)[alphabet_index(character)]
        new_characters << new_character
      else
        new_characters << character
      end
    end
    new_characters.join("")
  end

  def decrypt(message, key = nil, date = nil)
    create_shift(key, date)
    decrypted_messsage = unshift_message(message)
    {
      decryption: "#{decrypted_messsage}",
      key: "#{@key}",
      date: "#{@date}"
    }
  end
end
