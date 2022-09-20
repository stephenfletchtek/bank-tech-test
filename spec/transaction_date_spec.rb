# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'adds 200 on 10th Jan 2023' do
    time = Time.new(2023, 1, 10)
    @my_account.deposit(200, time)
    statement = "date || credit || debit || balance\n10/01/2023 || 200.00 || || 200.00"
    expect(@my_account.statement).to eq(statement)
  end

  it 'sorts in reverse date order' do
    time = Time.new(2023, 1, 10)
    @my_account.deposit(200, time)
    time = Time.new(2023, 1, 8)
    @my_account.withdraw(50, time)
    statement = "date || credit || debit || balance\n"\
    "10/01/2023 || 200.00 || || 150.00\n"\
    '08/01/2023 || || 50.00 || -50.00'
    expect(@my_account.statement).to eq(statement)
  end
end
