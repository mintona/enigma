class Key

  def self.generate_number
    number = rand(1..100000)
    sprintf('%05d', number)
  end

end
