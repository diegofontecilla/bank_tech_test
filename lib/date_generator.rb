require 'date'

class DateGenerator

  def get_time
    @current_time = Time.now
  end

  def print_date
    @current_time.strftime "%d/%m/%Y %H:%M"
  end
end
