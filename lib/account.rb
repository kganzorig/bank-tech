require 'date'
require_relative 'account_transaction'


class Account
    attr_reader :balance, :transactions

    def initialize
        @balance = 0
        @transactions = []
        @credit = nil
        @debit = nil
    end 

    def deposit(amount, date)
        @balance += amount
        @transactions << AccountTransaction.new(date, amount, credit: amount, debit: nil, balance: @balance)
    end

    def withdraw(amount, date)
        @balance -= amount
        @transactions << AccountTransaction.new(date, amount, credit: nil, debit: amount, balance: @balance)
    end 

    def print_statement
        puts 'date || credit || debit || balance'

        sorted_transactions = @transactions.sort_by(&:date).reverse

        sorted_transactions.each do |transaction|
            formatted_credit =  transaction.credit.nil? ? '' : format('%.2f', transaction.credit)
            formatted_debit = transaction.debit.nil? ? '' : format('%.2f', transaction.debit)
            formatted_balance = format('%.2f', transaction.balance)
            puts "#{transaction.date} || #{formatted_credit} || #{formatted_debit} || #{formatted_balance}"       
        end
    end
end