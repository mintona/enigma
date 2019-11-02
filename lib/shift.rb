class Shift
  attr_reader :key, :offset, :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(key, offset)
    @key = key
    @offset = offset
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

  def create_shift
    @a_shift = @key.a_key.to_i + @offset.a_offset.to_i
    @b_shift = @key.b_key.to_i + @offset.b_offset.to_i
    @c_shift = @key.c_key.to_i + @offset.c_offset.to_i
    @d_shift = @key.d_key.to_i + @offset.d_offset.to_i
  end


end
