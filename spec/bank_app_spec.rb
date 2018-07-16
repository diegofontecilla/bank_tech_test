require 'bank_app'

describe BankApp do
  it 'user can make a deposit on its account' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect(bank_app.account).to eq(20)
  end

  it 'user can make a withdrawal from its account' do
    bank_app = BankApp.new
    bank_app.deposit(40)
    bank_app.withdrawal(30)
    expect(bank_app.account).to eq(10)
  end

  it 'user can make a withdrawal only when the amount is available' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect {bank_app.withdrawal(30)}.to output("Withdrawal not allowed, you dont have the required amount\n").to_stdout
  end
end
