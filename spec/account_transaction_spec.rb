require 'rspec'
require_relative '../lib/account_transaction'
require 'date'

RSpec.describe AccountTransaction do
   let(:date) {Date.new(2023, 1, 10)}
   let(:amount) {1000.00}
   let(:credit) {0}
   let(:credit) {0}
   let(:debit) {0}
   let(:balance) {0}

    context 'when initial 1000.00 is dpeosited in account' do
        it 'sets balance' do
            transaction = AccountTransaction.new(date, amount, credit: amount)

            expect(transaction.date).to eq(date)
            expect(transaction.amount).to eq(amount)
            expect(transaction.credit).to eq(amount)
            expect(transaction.debit).to eq(0)
            expect(transaction.balance).to eq(balance)
        end 
    end 
end 