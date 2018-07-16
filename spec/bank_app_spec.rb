require 'bank_app'

describe BankApp do
  it 'user can make a deposit on its account' do
    bank_app = BankApp.new
    bank_app.deposit(20)
    expect(bank_app.account).to eq(20)
  end
end
