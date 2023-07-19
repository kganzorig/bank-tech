require 'rspec'
require_relative '../lib/account_transaction'
require 'date'

RSpec.describe AccountTransaction do
   let(:date) {2023-01-10}
   let(:amount) {1000.00}
   let(:credit) {0}
   let(:credit) {''}
   let(:debit) {''}
   let(:balance) {0}

    context 'when initial 1000.00 is deposited in account' do
        it 'sets balance' do
            transaction = AccountTransaction.new(date, amount, credit: amount)

            expect(transaction.date).to eq(date)
            expect(transaction.amount).to eq(amount)
            expect(transaction.credit).to eq(amount)
            expect(transaction.debit).to eq(0.00)
            expect(transaction.balance).to eq(balance)
        end 
    end 
end 