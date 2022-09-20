# frozen_string_literal: true

# BankAccount class accepts deposits, withdrawals, and check statement
class BankAccount
  def initialize
    @transactions = []
  end

  def statement
    output_list = transaction_list(@transactions)
    output_list << 'date || credit || debit || balance'
    output_list.reverse.join("\n")
  end

  def deposit(amount, time = Time.now)
    msg = 'deposit method takes a positive number as first argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
    raise 'second argument takes a Time object' unless time.is_a? Time

    @transactions << ([time, amount])
  end

  def withdraw(amount, time = Time.now)
    msg = 'withdraw method takes a positive number as first argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
    raise 'second argument takes a Time object' unless time.is_a? Time

    @transactions << ([time, -amount])
  end

  private

  def two_dec_pl(num)
    format('%.2f', num)
  end

  def time_to_str(time)
    time.strftime('%d/%m/%Y')
  end

  def credit_debit(amount)
    return " || #{two_dec_pl(amount)} || || " if amount.positive?

    " || || #{two_dec_pl(-amount)} || "
  end

  def transaction_list(transactions)
    balance = 0
    transactions.sort.map do |line|
      balance += line[1]
      time_to_str(line[0]).to_s + credit_debit(line[1]) + two_dec_pl(balance).to_s
    end
  end
end
