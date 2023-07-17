class Account

    def initialize
        @balance = 0
        @transactions = []
    end 

    def deposit(amount)
        @balance += amount
        @transactions << Transaction.new(Date.new(2023, 1, 10), amount, credit: amount, balance: @balance)
    end

    def withdraw(amount)
        @balance -= amount
        @transactions << Transaction.new(Date.new(2023, 1, 14), amount, debit: amount, balance: @balance)
    end 

    def print_statement
        puts 'date || credit || debit || balance'
        @transactions.each do |transaction| 
        puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
        end
    end
end