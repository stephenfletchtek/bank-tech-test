# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'adds 200 on 10th Jan 2023' do
    @my_account.deposit(200, "10/01/2023")
    statement = "date || credit || debit || balance\n10/01/2023 || 200.00 || || 200.00"
    expect(@my_account.statement).to eq(statement)
  end
end
