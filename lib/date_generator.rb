require 'time'

class DateGenerator

  def print_date
    get_time
    @current_time.strftime "%d/%m/%Y %H:%M"
  end

# I want to make get_time private but had trouble testing it

  def get_time
    @current_time = Time.now
  end
end
