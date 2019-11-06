require_relative './calculator'

class Shift
  # include Calculator

  def self.create_offset(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

  def self.split_key(key)
    characters = key.each_char.map { |character| character}
    pairs = characters.each_cons(2).map { |character| character }
    pairs.map { |pair| (pair.first + pair.last).to_i }
  end

  def self.create_shift(key, date)
    offset_array = create_offset(date).split("").map { |character| character.to_i }
    key_array = split_key(key)

    pairs = offset_array.zip(key_array)

    pairs.map { |pair| pair.sum}

    #
    # shift_values = Hash.new(0)
    # offset = create_offset(date)
    # shift_values[:a_shift] = key[0..1].to_i + offset[0].to_i
    # shift_values[:b_shift] = key[1..2].to_i + offset[1].to_i
    # shift_values[:c_shift] = key[2..3].to_i + offset[2].to_i
    # shift_values[:d_shift] = key[3..4].to_i + offset[3].to_i
    # shift_values
  end

end
