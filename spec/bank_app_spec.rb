require 'bank_app'

describe BankApp do
  it 'user can make a deposit on her account' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect(bank_app.balance).to eq(20)
  end

  it 'user can make a withdrawal from her account' do
    bank_app = BankApp.new
    bank_app.deposit(40)
    bank_app.withdrawal(30)
    expect(bank_app.balance).to eq(10)
  end

  it 'user can make a withdrawal only when the amount is available' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect {bank_app.withdrawal(30)}.to output("Withdrawal not allowed, you dont have the required amount\n").to_stdout
  end

  it 'when user make a deposit will generate a new credit, debit and balance' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect(bank_app.operations).to eq([{credit: 20, debit: '---', balance: 20}])
  end

  it 'when user make a withdrawal will generate a new credit, debit and balance' do
    bank_app = BankApp.new
    bank_app.deposit(30)
    bank_app.withdrawal(20)
    expect(bank_app.operations.last).to eq({credit: '---', debit: 20, balance: 10})
  end
end
