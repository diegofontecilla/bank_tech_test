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

  it 'when user make a deposit will generate a new date, credit, debit and balance' do
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

  it 'user can print her bank statement' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect {bank_app.print_statement}.to output("credit: 20 || debit: --- || balance: 20\n").to_stdout
  end

  it 'user can print her bank statement in reverse chronological order' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    bank_app.deposit(2000)
    expect {bank_app.print_statement}.to output("credit: 2000 || debit: --- || balance: 2020\ncredit: 20 || debit: --- || balance: 20\n").to_stdout
  end

  context '#get_date' do
    it 'print a date' do
      fake_date_generator = double(:date_generator)
      allow(fake_date_generator).to receive(:print_date).and_return("18/07/2018 10:14")
      bank_app = BankApp.new(fake_date_generator)
      expect(bank_app.get_date).to eq("18/07/2018 10:14")
    end
  end
end
