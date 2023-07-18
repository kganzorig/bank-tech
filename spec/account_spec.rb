require 'rspec'
require_relative '../lib/account_transaction'
require_relative '../lib/account'


 RSpec.describe Account do
    let(:account) { Account.new}

    before do 
        account.instance_variable_set(:@balance, 0)
        account.instance_variable_set(:@transactions, [])
    end 

    describe 'deposit' do
        let(:amount) {1000.00}
        it 'adds the amount and updates the balance' do
            account.deposit(amount, Date.new(2023, 1, 10))
            expect(account.balance).to eq (1000.00)
        end 

        it 'updates account to show transaction' do
            account.deposit(amount, Date.new(2023, 1, 10))
            transaction = account.transactions[0]

            expect(transaction.date).to eq(Date.new(2023, 1, 10))
            expect(transaction.amount).to eq(amount)
            expect(transaction.credit).to eq(amount)
            expect(transaction.debit).to eq(0.00)
            expect(transaction.balance).to eq(amount)
        end 
    end

    describe 'withdraw' do
        let(:amount) {1000.0}

        it 'minuses the amount from the balance' do
            account.withdraw(amount, Date.new(2023, 1, 14))
            expect(account.balance).to eq (-1000.00)
        end

        it 'updates account to show transaction' do
            account.withdraw(amount, Date.new(2023, 1, 14))
            transaction = account.transactions[0]

            expect(transaction.date).to eq(Date.new(2023, 1, 14))
            expect(transaction.amount).to eq(amount)
            expect(transaction.credit).to eq(0.00)
            expect(transaction.debit).to eq(amount)
            expect(transaction.balance).to eq(-1000.00)
        end 
    end 

    describe 'print bank statement' do
        it 'prints a table with amount deposited and withdrawn' do

            account.deposit(1000.00, Date.new(2023, 1, 10))
            account.deposit(2000.00, Date.new(2023, 1, 13))
            account.withdraw(500.00, Date.new(2023, 1, 14))

            expected_output =
                      "date || credit || debit || balance\n" \
                      "2023-01-14 || || 500.00 || 2500.00\n" \
                      "2023-01-13 || 2000.00 || || 3000.00\n" \
                      "2023-01-10 || 1000.00 || || 1000.00\n"

    expect { account.print_statement }.to output(expected_output).to_stdout
        end 
    end 
end
