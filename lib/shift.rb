class Shift

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
  end

end
