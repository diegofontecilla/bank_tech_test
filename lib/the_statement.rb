class TheStatement

    def print_statement(operations)
      operations.reverse.each do |op|
        puts "date: #{op[:date]} || credit: #{op[:credit]} || debit: #{op[:debit]} || balance: #{op[:balance]}"
     end

    end

end
