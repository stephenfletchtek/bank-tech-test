# frozen_string_literal: true

# BankAccount class accepts deposits, withdrawals, and check statement
class BankAccount
  def initialize
    @transactions = []
  end

  def statement
    data = 'date || credit || debit || balance'

    balance = 0
    data_list = @transactions.sort.map do |line|
      balance += (line[1] - line[2])
      "#{time_to_str(line[0])} ||#{two_dec_pl(line[1])} ||#{two_dec_pl(line[2])} ||#{two_dec_pl(balance)}"
    end

    data_list.reverse.each { |line| data += "\n#{line}" }
    data
  end

  def deposit(amount, time = Time.now)
    msg = 'deposit method takes a positive number as first argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
    raise 'second argument takes a Time object' unless time.is_a? Time

    @transactions << ([time, amount, 0])
  end

  def withdraw(amount, time = Time.now)
    msg = 'withdraw method takes a positive number as first argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
    raise 'second argument takes a Time object' unless time.is_a? Time

    @transactions << ([time, 0, amount])
  end

  private

  def two_dec_pl(num)
    return '' if num.zero?

    " #{format('%.2f', num)}"
  end

  def time_to_str(time)
    time.strftime('%d/%m/%Y')
  end
end
