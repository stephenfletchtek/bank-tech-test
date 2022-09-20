# frozen_string_literal: true

# BankAccount class accepts deposits, withdrawals, and check statement
class BankAccount
  def initialize
    @balance = 0
    @transactions = []
  end

  def statement
    data = 'date || credit || debit || balance'
    @transactions.reverse.each do |line|
      data += "\n#{time_to_str(line[0])} ||#{two_dec_pl(line[1])} ||#{two_dec_pl(line[2])} ||#{two_dec_pl(line[3])}"
    end
    data
  end

  def deposit(amount, time = Time.now)
    msg = 'deposit method takes one positive number as an argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?

    @balance += amount
    @transactions << ([time, amount, 0, @balance])
  end

  def withdraw(amount, time = Time.now)
    msg = 'withdraw method takes one positive number as an argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?

    @balance -= amount
    @transactions << ([time, 0, amount, @balance])
  end

  private

  def two_dec_pl(num)
    return '' if num.zero?

    " #{format('%.2f', num)}"
  end

  def time_to_str(time)
    return time unless time.is_a? Time
    
    time.strftime('%d/%m/%Y')
  end
end
