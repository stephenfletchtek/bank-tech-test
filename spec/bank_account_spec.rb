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

    it 'adds 100 and shows statement' do
      @my_account.deposit(100)
      result = @my_account.statement
      statement = 'date || credit || debit || balance\n'\
      '20/09/2022 || 100.00 || || 100.00'
      expect(result).to eq(statement)      
    end

    it 'adds 200, then 50, and shows statement' do
      @my_account.deposit(200)
      @my_account.deposit(50)
      result = @my_account.statement
      statement = 'date || credit || debit || balance\n'\
      '20/09/2022 || 50.00 || || 250.00\n'\
      '20/09/2022 || 200.00 || || 200.00'
      expect(result).to eq(statement)      
    end

    it 'adds 90, then 100, and shows statement' do
      @my_account.deposit(90)
      @my_account.deposit(100)
      result = @my_account.statement
      statement = 'date || credit || debit || balance\n'\
      '20/09/2022 || 100.00 || || 190.00\n'\
      '20/09/2022 || 90.00 || || 90.00'
      expect(result).to eq(statement)      
    end

  end
end
