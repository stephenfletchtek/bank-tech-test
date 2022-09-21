# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @time = double :time
    @my_account = BankAccount.new(0, @time)
    expect(@time).to receive(:now).and_return(Time.new(2023, 1, 10))
  end

  it 'sorts in reverse date order' do
    @my_account.deposit(200)
    expect(@time).to receive(:now).and_return(Time.new(2023, 1, 8))
    @my_account.withdraw(50)
    statement = "date || credit || debit || balance\n"\
    "10/01/2023 || 200.00 || || 150.00\n"\
    '08/01/2023 || || 50.00 || -50.00'
    expect(@my_account.statement).to eq(statement)
  end
end
