# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @my_account = BankAccount.new
  end

  it 'shows empty statement' do
    expect(@my_account.statement).to eq('date || credit || debit || balance')
  end

  it 'adds 200 and shows statement' do
    @my_account.deposit(200)
    statement = 'date || credit || debit || balance\n20/09/2022 || 200.00 || || 200.00'
    expect(@my_account.statement).to eq(statement)
  end

  it 'adds 100 and shows statement' do
    @my_account.deposit(100)
    statement = 'date || credit || debit || balance\n20/09/2022 || 100.00 || || 100.00'
    expect(@my_account.statement).to eq(statement)
  end

  it 'adds 200, then 50, and shows statement' do
    @my_account.deposit(200)
    @my_account.deposit(50)
    statement = 'date || credit || debit || balance\n'\
    '20/09/2022 || 50.00 || || 250.00\n20/09/2022 || 200.00 || || 200.00'
    expect(@my_account.statement).to eq(statement)
  end

  it 'adds 90, then 100, and shows statement' do
    @my_account.deposit(90)
    @my_account.deposit(100)
    statement = 'date || credit || debit || balance\n'\
    '20/09/2022 || 100.00 || || 190.00\n20/09/2022 || 90.00 || || 90.00'
    expect(@my_account.statement).to eq(statement)
  end
end
