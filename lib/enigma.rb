require 'date'
require_relative './shift'
require_relative './offset'
require_relative './key'

class Enigma
  attr_reader :alphabet, :key, :date, :shift

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @key = nil
    @date = nil
    @shift = nil
  end

  def create_shift(key, date)
    @shift = Shift.new(key, date)
    # require "pry"; binding.pry
  end

  def encrypt(message, key, date)
    encryption = {
                  encryption: "message",
                  key: "#{key}",
                  date: "#{date}"
                }
  end



  def shift_message(message)
    message = message.downcase
    message_character_array = message.split('')

    message_character_array.each_with_index do |character, index|
      if index == 0 || index == 4
        puts "#{character} is 0 or 4, so A shift"
      elsif index == 1 || index == 5
        puts "#{character} is 1 or 5, so B shift"
      elsif index == 2 || index == 6
        puts "#{character} is 2 or 6, so C shift"
      elsif index == 3 || index == 7
        puts "#{character} is 3 or 7, so D shift"
      end
    end

    find_index_in_alphabet_array = message_character_array.map do |char|
      @alphabet.find_index(char)
    end

    # x = []
    # message_character_array.each do |character|
    #   if @alphabet.include?(character)
    #     # puts character
    #     alphabet_index = @alphabet.find_index(character)
    #     # puts alphabet_index
    #     shifted_alphabet = @alphabet.rotate(3)
    #     new_character = shifted_alphabet[alphabet_index]
    #     # puts new_character
    #     puts "I was letter #{character} at regular alphabet index #{alphabet_index}. The alphabet got shifted by 3, so now I'm this new character: #{new_character}."
    #     x << new_character
    #   else
    #     # puts character
    #     puts "I started as #{character} and because I'm not in the alphabet array, I stayed the same, see?: #{character}"
    #     x << character
    #   end
    # end
    # new_message = x.join("")

    y = []
    message_character_array.each_with_index do |character, index|
      if @alphabet.include?(character) && index % 4 == 0
        alphabet_index = @alphabet.find_index(character)
        shifted_alphabet = @alphabet.rotate(3)
        new_character = shifted_alphabet[alphabet_index]
        puts "I was letter #{character} at regular alphabet index #{alphabet_index}. The alphabet got shifted by 3, so now I'm this new character: #{new_character}. My index is #{index} so I would get an A shift"
        y << new_character
      elsif @alphabet.include?(character) && index % 4 == 1
        alphabet_index = @alphabet.find_index(character)
        shifted_alphabet = @alphabet.rotate(3)
        new_character = shifted_alphabet[alphabet_index]
        puts "I was letter #{character} at regular alphabet index #{alphabet_index}. The alphabet got shifted by 3, so now I'm this new character: #{new_character}. My index is #{index} so I would get an B shift"
        y << new_character
      elsif @alphabet.include?(character) && index % 4 == 2
        alphabet_index = @alphabet.find_index(character)
        shifted_alphabet = @alphabet.rotate(3)
        new_character = shifted_alphabet[alphabet_index]
        puts "I was letter #{character} at regular alphabet index #{alphabet_index}. The alphabet got shifted by 3, so now I'm this new character: #{new_character}. My index is #{index} so I would get a C shift"
        y << new_character
      elsif @alphabet.include?(character) && index % 4 == 3
        alphabet_index = @alphabet.find_index(character)
        shifted_alphabet = @alphabet.rotate(3)
        new_character = shifted_alphabet[alphabet_index]
        puts "I was letter #{character} at regular alphabet index #{alphabet_index}. The alphabet got shifted by 3, so now I'm this new character: #{new_character}. My index is #{index} so I would get an D shift"
        y << new_character
      else
        puts "I started as #{character} and because I'm not in the alphabet array, I stayed the same, see?: #{character}"
        y << character
      end
    end

    new_message = y.join("")
  end
end
