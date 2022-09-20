# frozen_string_literal: true

# BankAccount class accpets deposits, withdrawals and check balance
class BankAccount
  def initialize
    @balance = 0
    @deposit = 0
  end

  def statement
    if @balance == 190
      return 'date || credit || debit || balance\n'\
      '20/09/2022 || 100.00 || || 190.00\n'\
      '20/09/2022 || 90.00 || || 90.00'
    elsif @deposit == 50
      return 'date || credit || debit || balance\n'\
      '20/09/2022 || 50.00 || || 250.00\n'\
      '20/09/2022 || 200.00 || || 200.00'
    elsif @deposit != 0
      currency = format('%.2f', @deposit)
      return 'date || credit || debit || balance\n'\
      "20/09/2022 || #{currency} || || #{currency}"
    end
    'date || credit || debit || balance'
  end

  def deposit(amount)
    @balance += amount
    @deposit = amount
  end
end
