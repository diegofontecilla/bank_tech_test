class BankApp
  attr_reader :balance

  def initialize(date_generator = DateGenerator.new)
    @balance = 0
    @operations = []
    @date_generator = date_generator
  end

  def deposit(amount)
    @balance += amount
    credit(amount)
  end

  def withdrawal(amount)
    if withdrawal_available?(amount)
      @balance -= amount
      debit(amount)
    else
      print_withdrawal_not_allowed_message
    end
  end

  def print_statement
    @operations.reverse.each do |op|
      puts "date: #{op[:date]} || credit: #{op[:credit]} || debit: #{op[:debit]} || \
balance: #{op[:balance]}"
    end
  end

  private

  def get_date
    @date = @date_generator.format_date
  end

  def credit(amount)
    @operations << {date: get_date, credit: amount, debit: '---', balance: @balance}
  end

  def debit(amount)
    @operations << {date: get_date, credit: '---', debit: amount, balance: @balance}
  end

  def withdrawal_available?(amount)
    @balance > amount ? true : false
  end

  def print_withdrawal_not_allowed_message
    puts 'Withdrawal not allowed, you dont have the required amount'
  end
end
