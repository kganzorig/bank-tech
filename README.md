# Bank Tech Design Recipe

## 1. User Story 

As a customer
I want to be able to make deposits

As a customer 
I want to be able to make withdrawals

As a customer 
So that I can see a log of my transactions and my balance I want to print my statement with dates included

## 2. Installation

### Install RSpec 

Gem install bundler 
touch Gemfile
bundle install

## 3. Design the Class System

                   ┌─────────────┐
                   │  Account    │
                   │ Transaction │
                   │             │
                   │             │
                   └────────┬────┘
                            │
                            │
                            │
                            │           ┌──────────────┐
                            │           │              │
                            │           │ Account      │
                            └─────────► │              │
                                        │              │
                                        │              │
                                        │              │
                                        └──────────┬───┘
Also design the interface of each class in more detail._

```ruby
class AccountTransaction

    attr_reader :date, :amount, :credit, :debit, :balance

    def initialize(date, amount, credit: 0.00, debit: 0.00, balance: 0.00)
        @date = date
        @amount = amount
        @credit = credit
        @debit = debit
        @balance = balance
    end
end

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



