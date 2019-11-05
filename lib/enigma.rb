require 'date'

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
    return @shift.a_shift if index % 4 == 0
    return @shift.b_shift if index % 4 == 1
    return @shift.c_shift if index % 4 == 2
    return @shift.d_shift if index % 4 == 3
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
    message_characters = message.downcase.split('')
    new_characters = message_characters.each_with_index.map do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = shift_alphabet(shift_amount)[alphabet_index(character)]
      else
        character
      end
    end.join("")
  end

  def encrypt(message, key = nil, date = nil)
    create_shift(key, date)
    confirmation = Hash.new(0)
    confirmation[:encryption] = "#{shift_message(message)}"
    confirmation[:key] = "#{@key}"
    confirmation[:date] = "#{@date}"
    confirmation
  end

  def unshift_message(message)
    message_characters = message.downcase.split('')
    message_characters.each_with_index.map do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = shift_alphabet(-shift_amount)[alphabet_index(character)]
      else
        character
      end
    end.join("")
  end

  def decrypt(message, key = nil, date = nil)
    create_shift(key, date)
    confirmation = Hash.new(0)
    confirmation[:decryption] = "#{unshift_message(message)}"
    confirmation[:key] = "#{@key}"
    confirmation[:date] = "#{@date}"
    confirmation
  end
end
