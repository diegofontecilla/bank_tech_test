class BankApp
  attr_reader :balance, :operations

  def initialize
    @balance = 0
    @operations = []
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
