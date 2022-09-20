# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @my_account = BankAccount.new
  end

  context 'empty bank account' do
    it 'shows empty statement' do
      expect(@my_account.statement).to eq('date || credit || debit || balance')
    end
  end

  context 'single deposits' do
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
  end
end
