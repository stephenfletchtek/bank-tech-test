# frozen_string_literal: true

# BankAccount class accpets deposits, withdrawals and check balance
class BankAccount
  def initialize
    @deposit = 0
  end

  def statement
    if @deposit != 0
      currency = '%.2f' % @deposit
      return 'date || credit || debit || balance\n'\
      "20/09/2022 || #{currency} || || #{currency}"
    end
    'date || credit || debit || balance'
  end

  def deposit(amount)
    @deposit = amount
  end
end
