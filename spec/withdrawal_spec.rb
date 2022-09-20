# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'can go overdrawn' do
    @my_account.withdraw(50)
    statement = "date || credit || debit || balance\n20/09/2022 || || 50.00 || -50.00"
    expect(@my_account.statement).to eq(statement)
  end

  it 'adds 200, withdraws 50 and shows statement' do
    @my_account.deposit(200)
    @my_account.withdraw(50)
    statement = "date || credit || debit || balance\n"\
    "20/09/2022 || || 50.00 || 150.00\n"\
    '20/09/2022 || 200.00 || || 200.00'
    expect(@my_account.statement).to eq(statement)
  end
end
