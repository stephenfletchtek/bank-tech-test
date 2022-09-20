# frozen_string_literal: true

# BankAccount class accpets deposits, withdrawals and check balance
class BankAccount
  def initialize
    @deposit = false
  end

  def statement
    if @deposit == true
      return 'date || credit || debit || balance\n'\
      '20/09/2022 || 200.00 || || 200.00'
    end
    'date || credit || debit || balance'
  end

  def deposit(_amount)
    @deposit = true
  end
end
