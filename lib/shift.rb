class Shift
  attr_reader :key, :offset, :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(key, offset)
    # def initialize(key = Key.generate_number, offset = Offset.generate_date)
    @key = key
    @offset = offset
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

  def create_shift
    @a_shift = @key[0..1].to_i + @offset[0].to_i
    @b_shift = @key[1..2].to_i + @offset[1].to_i
    @c_shift = @key[2..3].to_i + @offset[2].to_i
    @d_shift = @key[3..4].to_i + @offset[3].to_i
    # keys =  {
    #         a_key => @key[0..1],
    #         b_key => @key[1..2],
    #         c_key => @key[2..3],
    #         d_key => @key[3..4]
    #         }
    # @offset

  end
  # def create_shift
  #   @a_shift = @key.a_key.to_i + @offset.a_offset.to_i
  #   @b_shift = @key.b_key.to_i + @offset.b_offset.to_i
  #   @c_shift = @key.c_key.to_i + @offset.c_offset.to_i
  #   @d_shift = @key.d_key.to_i + @offset.d_offset.to_i
  # end


end
