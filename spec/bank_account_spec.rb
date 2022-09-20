# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @my_account = BankAccount.new
  end

  context 'BankAccount class methods and behaviour' do
    it 'shows empty statement' do
      result = @my_account.statement
      statement = 'date || credit || debit || balance'
      expect(result).to eq(statement)
    end

    it 'adds 200 and shows statement' do
      @my_account.deposit(200)
      result = @my_account.statement
      statement = 'date || credit || debit || balance\n'\
      '20/09/2022 || 200.00 || || 200.00'
      expect(result).to eq(statement)
    end
  end
end
