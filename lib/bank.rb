require_relative('./bank_account')
require_relative('./statement')

# Bank class coordinates BankAccount and Statement classes
class Bank
  def initialize(bank_account = BankAccount.new, statement = Statement.new)
    @bank_account = bank_account
    @statement = statement
  end

  def show_statement
    @statement.create_statement(@bank_account)
  end

  def deposit(amount)
    check_args(amount)
    @bank_account.transact(amount)
  end

  def withdraw(amount)
    check_args(amount)
    @bank_account.transact(-amount)
  end

  private

  def check_args(amount)
    msg = 'method takes a positive number as an argument'
    raise msg unless (amount.is_a? Numeric) && amount.positive?
  end
end
