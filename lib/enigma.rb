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
    if key == nil
      key = Key.generate_number
      # @key = key
    end

    if date == nil
      date = Offset.generate_date
      # @date = date
    end
    @key = key
    @date = date
    @shift = Shift.new(key, date)
    @shift.create_shift
  end

#test this!
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
#test this!
  def in_alphabet?(character)
    @alphabet.include?(character)
  end
#test this!
  def alphabet_index(character)
    @alphabet.find_index(character)
  end
#test this!
  def shift_alphabet(shift_amount)
    @alphabet.rotate(shift_amount)
  end

  def shift_message(message)
    message = message.downcase
    message_character_array = message.split('')

    new_characters = []
    message_character_array.each_with_index do |character, index|
      if in_alphabet?(character)
        shift_amount = determine_shift_amount(index)
        new_character = shift_alphabet(shift_amount)[alphabet_index(character)]
        new_characters << new_character
      else
        new_characters << character
      end
    end
    new_message = new_characters.join("")
  end

  # def shift_message(message) ****** THIS WORKS*****
  #   message = message.downcase
  #   message_character_array = message.split('')
  #
  #   new_characters = []
  #
  #   message_character_array.each_with_index do |character, index|
  #     if @alphabet.include?(character) && index % 4 == 0
  #       alphabet_index = @alphabet.find_index(character)
  #       shifted_alphabet = @alphabet.rotate(@shift.a_shift)
  #       new_character = shifted_alphabet[alphabet_index]
  #       new_characters << new_character
  #     elsif @alphabet.include?(character) && index % 4 == 1
  #       alphabet_index = @alphabet.find_index(character)
  #       shifted_alphabet = @alphabet.rotate(@shift.b_shift)
  #       new_character = shifted_alphabet[alphabet_index]
  #       new_characters << new_character
  #     elsif @alphabet.include?(character) && index % 4 == 2
  #       alphabet_index = @alphabet.find_index(character)
  #       shifted_alphabet = @alphabet.rotate(@shift.c_shift)
  #       new_character = shifted_alphabet[alphabet_index]
  #       new_characters << new_character
  #     elsif @alphabet.include?(character) && index % 4 == 3
  #       alphabet_index = @alphabet.find_index(character)
  #       shifted_alphabet = @alphabet.rotate(@shift.d_shift)
  #       new_character = shifted_alphabet[alphabet_index]
  #       new_characters << new_character
  #     else
  #       new_characters << character
  #     end
  #   end
  #   new_message = new_characters.join("")
  # end

  def encrypt(message, key = nil, date = nil)
    create_shift(key, date)
    encrypted_message = shift_message(message)
    encryption = {
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
    new_message = new_characters.join("")
  end

  def decrypt(message, key = nil, date = nil)
    create_shift(key, date)
    decrypted_messsage = unshift_message(message)
    decryption = {
                  decryption: "#{decrypted_messsage}",
                  key: "#{@key}",
                  date: "#{@date}"
                }
  end
end
