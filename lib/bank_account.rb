# frozen_string_literal: true

# BankAccount class accepts deposits, withdrawals, and check statement
class BankAccount
  def initialize
    @balance = 0
    @transactions = []
  end

  def statement
    data = 'date || credit || debit || balance'
    @transactions.each do |line|
      data += "\n20/09/2022 ||#{two_dec_pl(line[0])} ||#{two_dec_pl(line[1])} ||#{two_dec_pl(line[2])}"
    end
    data
  end

  def deposit(amount)
    msg = 'deposit method takes one positive number as an argument'
    fail msg unless amount.is_a? Numeric
    fail msg unless amount.positive?

    @balance += amount
    @transactions.unshift([amount, 0, @balance])
  end

  def withdraw(amount = 0)
    return unless amount.positive?

    @balance -= amount
    @transactions.unshift([0, amount, @balance])
  end

  private

  def two_dec_pl(num)
    return '' if num.zero?

    " #{format('%.2f', num)}"
  end
end
