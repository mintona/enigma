require_relative './calculator'

class Shift
  include Calculator

  attr_reader :key, :date, :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(key, date)
    @key = key
    @date = date
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

  def create_offset
    square(@date.to_i).to_s[-4..-1]
    #where do I test this square method from my calculator?
  end

  def create_shift
    offset = create_offset
    @a_shift = @key[0..1].to_i + offset[0].to_i
    @b_shift = @key[1..2].to_i + offset[1].to_i
    @c_shift = @key[2..3].to_i + offset[2].to_i
    @d_shift = @key[3..4].to_i + offset[3].to_i
  end

end
