# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'shows empty statement' do
    expect(@my_account.statement).to eq('date || credit || debit || balance')
  end

  it 'makes no deposit' do
    @my_account.deposit()
    expect(@my_account.statement).to eq('date || credit || debit || balance')    
  end

  it 'makes zero deposit' do
    @my_account.deposit(0)
    expect(@my_account.statement).to eq('date || credit || debit || balance')    
  end

  it 'can go overdrawn' do
    @my_account.withdraw(50)
    statement = "date || credit || debit || balance\n20/09/2022 || || 50.00 || -50.00"
    expect(@my_account.statement).to eq(statement)
  end

  it 'rejects a string argument' do
    expect{ @my_account.deposit("loadsa money") }.to raise_error("deposit method takes one positive number as an argument")
  end
end
