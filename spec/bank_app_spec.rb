require 'bank_app'

describe BankApp do

  before :each do
    allow(fake_date_generator).to receive(:format_date).and_return("18/07/2018 10:14")
  end

  let(:fake_date_generator) {double(:date_generator)}
  let(:fake_statement) {double(:the_statement)}
  subject(:bank_app) { described_class.new }
  subject(:bank_app_arg) { described_class.new(fake_date_generator) }
  subject(:bank_app_arg_2) { described_class.new(fake_date_generator, fake_statement) }

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

  it 'user can print her bank statement' do
    op = "date: 19/07/2018 21:03 || credit: 90000 || debit: --- || balance: 90000"
    allow(fake_statement).to receive(:print_statement).and_return(op)
    expect(bank_app_arg_2.get_statement).to eq(op)
  end

end
