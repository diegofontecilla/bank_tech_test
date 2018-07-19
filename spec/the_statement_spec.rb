require 'the_statement'

describe TheStatement do

  context '#print_statement' do

    it 'user can print her bank statement' do
      op = "date: 18/07/2018 10:14 || credit: 20 || debit: --- || balance: 20\n"
      the_statement = TheStatement.new
      fake_operations = [{date: "18/07/2018 10:14", credit: "20", debit: '---', balance: "20\n"}]
      expect{ the_statement.print_statement(fake_operations) }.to output(op).to_stdout
    end

    it 'user can print her bank statement in reverse chronological order' do
      op = "date: 18/07/2018 10:14 || credit: 2000 || debit: --- || balance: 2020\ndate: 18/07/2018 10:14 || credit: 20 || debit: --- || balance: 20\n"
      the_statement = TheStatement.new
      fake_operations = [{date: "18/07/2018 10:14", credit: "20", debit: '---', balance: "20"},
                         {date: "18/07/2018 10:14", credit: "2000", debit: '---', balance: "2020"}]
      expect{ the_statement.print_statement(fake_operations) }.to output(op).to_stdout
    end

  end

end
