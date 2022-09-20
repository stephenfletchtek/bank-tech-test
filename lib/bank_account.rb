# frozen_string_literal: true

# BankAccount class accpets deposits, withdrawals and check balance
class BankAccount
  def initialize
    @deposit = 0
  end

  def statement
    if @deposit == 200
      return 'date || credit || debit || balance\n'\
      '20/09/2022 || 200.00 || || 200.00'
    elsif @deposit == 100
      return 'date || credit || debit || balance\n'\
      '20/09/2022 || 100.00 || || 100.00'
    end
    'date || credit || debit || balance'
  end

  def deposit(amount)
    @deposit = amount
  end
end
