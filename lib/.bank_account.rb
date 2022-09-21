# frozen_string_literal: true

# BankAccount class accepts deposits, withdrawals, and check statement
class BankAccount
  def initialize(opening_balance = 0, time = Time)
    @opening_balance = opening_balance
    @time = time
    @transactions = []
  end

  def statement
    output_list = sorted_transaction_list(@transactions)
    output_list << 'date || credit || debit || balance'
    output_list.reverse.join("\n")
  end

  def deposit(amount)
    check_args(amount)
    @transactions << ([@time.now, amount])
  end

  def withdraw(amount)
    check_args(amount)
    @transactions << ([@time.now, -amount])
  end

  private

  def two_dec_pl(num)
    format('%.2f', num)
  end

  def time_to_str(time)
    time.strftime('%d/%m/%Y')
  end

  def credit_or_debit(amount)
    return " || #{two_dec_pl(amount)} || || " if amount.positive?

    " || || #{two_dec_pl(-amount)} || "
  end

  def sorted_transaction_list(transactions)
    accumulator = @opening_balance
    transactions.sort.map do |line|
      accumulator += line[1]
      time_to_str(line[0]) + credit_or_debit(line[1]) + two_dec_pl(accumulator)
    end
  end

  def check_args(amount)
    msg = 'method takes a positive number as an argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
  end
end
