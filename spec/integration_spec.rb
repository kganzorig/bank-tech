require_relative '../lib/account_transaction'
require_relative '../lib/account'
require 'date'

RSpec.describe 'integration' do
    context 'when deposits/withdrawls are made' do
        it 'shows correct balance with transactions listed' do
        account = Account.new 

        account.deposit(1000.00, Date.new(2023, 1, 10))
        account.deposit(2000.00, Date.new(2023, 1, 13))
        account.withdraw(500.00, Date.new(2023, 1, 14))

        expected_output =
        "date || credit || debit || balance\n" \
        "2023-01-14 ||  || 500.00 || 2500.00\n" \
        "2023-01-13 || 2000.00 ||  || 3000.00\n" \
        "2023-01-10 || 1000.00 ||  || 1000.00\n"

        expect { account.print_statement }.to output(expected_output).to_stdout
        end 
    end
end 