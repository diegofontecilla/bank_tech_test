class TheStatement
  def print_statement(operations)
    puts 'date || credit || debit || balance'

    operations.reverse.each do |op|
      puts "#{op[:date]} || #{op[:credit]} || #{op[:debit]} || #{op[:balance]}"
    end
  end
end
