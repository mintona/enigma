class Key

  def self.generate_number
    #rand.to_s[2..6]
    number = rand(1..100000)
    sprintf('%05d', number)
  end


  # attr_reader :a_key, :b_key, :c_key, :d_key
  #
  # def initialize
  #   #do we want to do all this at initialization?
  #   @a_key = nil
  #   @b_key = nil
  #   @c_key = nil
  #   @d_key = nil
  # end
  #
  # def generate_number
  #   number = rand(10000..100000).to_s
  # end
  #
  # def set_keys
  #   number = generate_number
  #   @a_key = number[0..1]
  #   @b_key = number[1..2]
  #   @c_key = number[2..3]
  #   @d_key = number[3..4]
  # end

end
