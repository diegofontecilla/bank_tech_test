class BankApp
  attr_reader :account

  def initialize
    @account = 0
  end

  def deposit(amount)
    @account += amount
  end
end
