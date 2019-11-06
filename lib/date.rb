require 'date'

class Date

  def self.generate_date
    date = Date.today
    date.strftime("%d%m%y")
  end

end
