# BankAccount class holds transactions
class BankAccount
  attr_reader :opening_balance

  def initialize(opening_balance = 0, time = Time)
    @time = time
    @opening_balance = opening_balance
    @transactions = []
  end

  def transact(amount)
    time = @time.now
    @transactions << ([time, amount])
    [time, amount]
  end

  # def all_transactions
    # @transactions.sort
  # end

  def all_transactions
    accumulator = @opening_balance
    @transactions.sort.map { |transaction| transaction << accumulator += transaction[1] }
  end
end
