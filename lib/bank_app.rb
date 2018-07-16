class BankApp
  attr_reader :account

  def initialize
    @account = 0
  end

  def deposit(amount)
    @account += amount
  end


  def withdrawal(amount)
    if withdrawal_available?(amount)
      @account -= amount
    else
      withdrawal_not_allowed_message
    end
  end

  private

  def withdrawal_available?(amount)
    @account > amount ? true : false
  end

  def withdrawal_not_allowed_message
    puts 'Withdrawal not allowed, you dont have the required amount'
  end
end
