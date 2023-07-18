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