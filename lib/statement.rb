# Statement class has a create_statement method that accepts a BankAccount
class Statement
  def create_statement(bank_account)
    output_list = format_transaction_list(bank_account)
    output_list << 'date || credit || debit || balance'
    output_list.reverse.join("\n")
  end

  private

  def two_dec_pl(num)
    format('%.2f', num)
  end

  def credit_or_debit(amount)
    return " || #{two_dec_pl(amount)} || || " if amount.positive?

    " || || #{two_dec_pl(-amount)} || "
  end

  def all_transactions_with_balance(bank_account)
    accumulator = bank_account.opening_balance
    bank_account.all_transactions.map do |transaction| 
      accumulator += transaction[1]
      transaction << accumulator
    end
  end

  def format_transaction_list(bank_account)
    all_transactions_with_balance(bank_account).map do |line|
      line[0].strftime('%d/%m/%Y') + credit_or_debit(line[1]) + two_dec_pl(line[2])
    end
  end
end
