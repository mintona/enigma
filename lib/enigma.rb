require 'date'

class Enigma
  attr_reader :alphabet, :key, :date, :shift

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key = Key.generate_number
    @date = Offset.generate_date
    @shift = []
  end

  def populate_shift(key = @key, date = @date)
    @shift = Shift.create_shift(key, date)
  end

  def determine_shift_amount(index)
    return @shift[0] if index % 4 == 0
    return @shift[1] if index % 4 == 1
    return @shift[2] if index % 4 == 2
    return @shift[3] if index % 4 == 3
  end

  def in_alphabet?(character)
    @alphabet.include?(character.downcase)
  end

  def alphabet_index(character)
    @alphabet.find_index(character.downcase)
  end

  def rotate_alphabet(shift_amount)
    @alphabet.rotate(shift_amount)
  end

  def message_characters(message)
    message.downcase.split('')
  end

  def shift_message(message)
    message_characters(message).each_with_index.map do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = rotate_alphabet(shift_amount)[alphabet_index(character)]
      else
        character
      end
    end.join("")
  end

  def unshift_message(message)
    message_characters(message).each_with_index.map do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = rotate_alphabet(-shift_amount)[alphabet_index(character)]
        # rotate_alphabet(-shift_amount)[alphabet_index(character)]
      else
        character
      end
    end.join("")
  end

  def encrypt(message, key = @key, date = @date)
    populate_shift(key, date)
    encrypted_message = shift_message(message)
    {encryption: "#{encrypted_message}", key: "#{key}", date: "#{date}"}
  end

  def decrypt(message, key = @key, date = @date)
    populate_shift(key, date)
    decrypted_messsage = unshift_message(message)
    {decryption: "#{decrypted_messsage}", key: "#{key}", date: "#{date}"}
  end
end
