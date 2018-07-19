require 'bank_app'

describe BankApp do

  before :each do
    allow(fake_date_generator).to receive(:format_date).and_return("18/07/2018 10:14")
  end

  let(:fake_date_generator) {double(:date_generator)}
  subject(:bank_app) { described_class.new }
  subject(:bank_app_arg) { described_class.new(fake_date_generator) }

  it 'user can make a deposit on her account' do
    bank_app.deposit(20)
    expect(bank_app.balance).to eq(20)
  end

  it 'user can make a withdrawal from her account' do
    bank_app.deposit(40)
    bank_app.withdrawal(30)
    expect(bank_app.balance).to eq(10)
  end

  it 'user can make a withdrawal only when the amount is available' do
    bank_app.deposit(20)
    not_allow = "Withdrawal not allowed, you dont have the required amount\n"
    expect {bank_app.withdrawal(30)}.to output(not_allow).to_stdout
  end

  context '#print_statement' do

    it 'user can print her bank statement after making a deposit' do
      bank_app_arg.deposit(20)
      op = "date: 18/07/2018 10:14 || credit: 20 || debit: --- || balance: 20\n"
      expect {bank_app_arg.print_statement}.to output(op).to_stdout
    end

    it 'user can print her bank statement in reverse chronological order' do
      bank_app_arg.deposit(20)
      bank_app_arg.deposit(2000)
      ops = "date: 18/07/2018 10:14 || credit: 2000 || debit: --- || balance: 2020\n"\
            "date: 18/07/2018 10:14 || credit: 20 || debit: --- || balance: 20\n"
      expect {bank_app_arg.print_statement}.to output(ops).to_stdout
    end

    it 'user can print her bank statement after making a withdrawal' do
      bank_app_arg.deposit(2000)
      bank_app_arg.withdrawal(20)
      ops = "date: 18/07/2018 10:14 || credit: --- || debit: 20 || balance: 1980\n"\
            "date: 18/07/2018 10:14 || credit: 2000 || debit: --- || balance: 2000\n"
      expect {bank_app_arg.print_statement}.to output(ops).to_stdout
    end
  end
end
