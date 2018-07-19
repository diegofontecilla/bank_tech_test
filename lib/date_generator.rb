require 'time'

class DateGenerator

  def format_date
    get_time
    @current_time.strftime "%d/%m/%Y %H:%M"
  end

private

  def get_time
    @current_time = Time.now
  end
end
