# Bank Tech Design Recipe

## 1. User Story 

As a customer
I want to be able to make deposits

As a customer 
I want to be able to make withdrawals

As a customer 
So that I can see a log of my transactions and my balance I want to print my statement with dates included

## 2. Design the Class System

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

    def initialize(date, amount, credit: 0, debit: 0, balance: 0)
        @date = date
        @amount = amount
        @credit = credit
        @debit = debit
        @balance = balance
    end
end

class Account

    def initialize
        @balance = 0
        @transactions = []
    end 

    def deposit(amount)
        @balance += amount
        @transactions << AccountTransaction.new(Date.new(2023, 1, 10), amount, credit: amount, balance: @balance)
    end

    def withdraw(amount)
        @balance -= amount
        @transactions << AccountTransaction.new(Date.new(2023, 1, 14), amount, debit: amount, balance: @balance)
    end 

    def print_statement
        puts 'date || credit || debit || balance'
        @transactions.each do |transaction| 
        puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
        end
    end
end

## 2. Design the Class System


