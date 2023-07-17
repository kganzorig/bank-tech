class AccountTransaction

    def initialize(date, amount, credit: 0, debit: 0, balance: 0)
        @date = date
        @amount = amount
        @credit = credit
        @debit = debit
        @balance = balance
    end
end