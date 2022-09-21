# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @time = double :time
    @my_account = BankAccount.new(0, @time)
    expect(@time).to receive(:now).and_return(Time.new(2022, 9, 20, 12))
  end

  context 'double deposit' do
    it 'adds 200, then 50, and shows statement' do
      @my_account.deposit(200)
      expect(@time).to receive(:now).and_return(Time.new(2022, 9, 20, 13))
      @my_account.deposit(50)
      statement = "date || credit || debit || balance\n"\
      "20/09/2022 || 50.00 || || 250.00\n"\
      '20/09/2022 || 200.00 || || 200.00'
      expect(@my_account.statement).to eq(statement)
    end

    it 'adds 90, then 100, and shows statement' do
      @my_account.deposit(90)
      expect(@time).to receive(:now).and_return(Time.new(2022, 9, 20, 13))
      @my_account.deposit(100)
      statement = "date || credit || debit || balance\n"\
      "20/09/2022 || 100.00 || || 190.00\n"\
      '20/09/2022 || 90.00 || || 90.00'
      expect(@my_account.statement).to eq(statement)
    end
  end
end
