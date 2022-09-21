# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    time = double :time
    expect(time).to receive(:now).and_return(Time.new(2022, 9, 20))
    @my_account = BankAccount.new(0, time)
  end

  xit 'adds 200 and shows statement' do
    @my_account.deposit(200)
    statement = "date || credit || debit || balance\n20/09/2022 || 200.00 || || 200.00"
    expect(@my_account.statement).to eq(statement)
  end

  xit 'adds 100 and shows statement' do
    @my_account.deposit(100)
    statement = "date || credit || debit || balance\n20/09/2022 || 100.00 || || 100.00"
    expect(@my_account.statement).to eq(statement)
  end

  xit 'adds 3.1415927 and shows statement' do
    @my_account.deposit(3.1415927)
    statement = "date || credit || debit || balance\n20/09/2022 || 3.14 || || 3.14"
    expect(@my_account.statement).to eq(statement)
  end

  xit 'deposits 50 + 150' do
    @my_account.deposit(50 + 150)
    statement = "date || credit || debit || balance\n20/09/2022 || 200.00 || || 200.00"
    expect(@my_account.statement).to eq(statement)
  end
end
