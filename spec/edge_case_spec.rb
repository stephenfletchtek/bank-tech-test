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

  it 'makes no deposit' do
    @my_account.deposit(0)
    expect(@my_account.statement).to eq('date || credit || debit || balance')    
  end
end
