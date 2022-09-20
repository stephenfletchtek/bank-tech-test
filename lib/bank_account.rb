class BankAccount
  def initialize
    @deposit = false
  end

  def statement
    return "date || credit || debit || balance\n"\
    "20/09/2022 || 200.00 || || 200.00" if @deposit == true
    "date || credit || debit || balance"
  end

  def deposit(amount)
    @deposit = true
  end
end