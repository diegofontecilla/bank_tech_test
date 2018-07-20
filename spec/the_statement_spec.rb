require 'the_statement'

describe TheStatement do

  context '#print_statement' do

    it 'user can print her bank statement' do
      op = "date || credit || debit || balance\n18/07/2018 || 20 ||  || 20\n"
      the_statement = TheStatement.new
      fake_operations = [{date: "18/07/2018", credit: "20", debit: nil, balance: "20"}]
      expect{ the_statement.print_statement(fake_operations) }.to output(op).to_stdout
    end

    it 'user can print her bank statement in reverse chronological order' do
      op = "date || credit || debit || balance\n18/07/2018 ||  || 5 || 15\n18/07/2018 || 20 ||  || 20\n"
      the_statement = TheStatement.new
      fake_operations = [{date: "18/07/2018", credit: "20", debit: nil, balance: "20"},
                         {date: "18/07/2018", credit: nil, debit: "5", balance: "15"}]
      expect{ the_statement.print_statement(fake_operations) }.to output(op).to_stdout
    end
  end
end
