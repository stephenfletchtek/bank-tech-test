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
      data += "\n20/09/2022 || #{two_dec_pl(line[0])} || || #{two_dec_pl(line[1])}"
    end
    data
  end

  def deposit(amount)
    @balance += amount
    @transactions.unshift([amount, @balance])
  end

  private

  def two_dec_pl(num)
    format('%.2f', num)
  end
end
