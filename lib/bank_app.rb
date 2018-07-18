class BankApp
  attr_reader :balance, :operations

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
      withdrawal_not_allowed_message
    end
  end

  def print_statement
    @operations.reverse.each do |one_operation|
      puts "credit: #{one_operation[:credit]} || debit: #{one_operation[:debit]} || balance: #{one_operation[:balance]}"
    end
  end

  def get_date
    @date = @date_generator.print_date
  end

  private

  def credit(amount)
    @operations << {credit: amount, debit: '---', balance: @balance}
  end

  def debit(amount)
    @operations << {credit: '---', debit: amount, balance: @balance}
  end

  def withdrawal_available?(amount)
    @balance > amount ? true : false
  end

  def withdrawal_not_allowed_message
    puts 'Withdrawal not allowed, you dont have the required amount'
  end
end
