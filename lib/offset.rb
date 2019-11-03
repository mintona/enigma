require 'date'
# require_relative './calculator'

class Offset

  def self.generate_date
    date = Date.today
    date.strftime("%d%m%y")
  end
  #include Calculator

  # attr_reader :date, :a_offset, :b_offset, :c_offset, :d_offset
  #
  # def initialize(date = Date.today)
  #   @date = date
  #   @a_offset = nil
  #   @b_offset = nil
  #   @c_offset = nil
  #   @d_offset = nil
  # end
  #
  # def date_to_string
  #   @date = @date.strftime("%d%m%y")
  # end
  #
  # def set_offsets
  #   digits = last_four
  #   @a_offset = digits[0]
  #   @b_offset = digits[1]
  #   @c_offset = digits[2]
  #   @d_offset = digits[3]
  #
  # end
  #
  # def last_four
  #   numeric_date = date_to_string.to_i
  #   working_number = square(numeric_date).to_s
  #   #where does the square method need to be tested?
  #   working_number[-4..-1]
  # end
end
