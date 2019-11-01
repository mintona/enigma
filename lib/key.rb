class Key
  attr_reader :a_key, :b_key, :c_key, :d_key

  def initialize(number)
    @a_key = number[0,1]
    @b_key = number[1][2]
    @c_key = number[2][3]
    @d_key = number[3][4]
  end
end
