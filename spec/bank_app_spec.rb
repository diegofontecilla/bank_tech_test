require 'bank_app'

describe BankApp do
  it 'user can make a deposit on its account' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect(bank_app.account).to eq(20)
  end

  it 'user can make a withdrwal on its account' do
    bank_app = BankApp.new
    bank_app.deposit(40)
    bank_app.withdrwal(30)
    expect(bank_app.account).to eq(10)
  end
end
