require 'date'

class Offset

  def self.generate_date
    date = Date.today
    date.strftime("%d%m%y")
  end
  
end
