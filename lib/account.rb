require 'date'
require_relative 'account_transaction'


class Account
    attr_reader :balance, :transactions

    def initialize
        @balance = 0
        @transactions = []
    end 

    def deposit(amount, date)
        @balance += amount
        @transactions << AccountTransaction.new(date, amount, credit: amount, balance: @balance)
    end

    def withdraw(amount, date)
        @balance -= amount
        @transactions << AccountTransaction.new(date, amount, debit: amount, balance: @balance)
    end 

    def print_statement
        puts 'date || credit || debit || balance'

        sorted_transactions = @transactions.sort_by(&:date).reverse

        sorted_transactions.each do |transaction|
            formatted_credit = format('%.2f', transaction.credit)
            formatted_debit = format('%.2f', transaction.debit)
            formatted_balance = format('%.2f', transaction.balance)
            puts "#{transaction.date} || #{formatted_credit} || #{formatted_debit} || #{formatted_balance}"        end
    end
end