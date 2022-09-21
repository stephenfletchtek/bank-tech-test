# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) do
    @time = double :time
    @my_account = BankAccount.new(0, @time)
    expect(@time).to receive(:now).and_return(Time.new(2023, 1, 10))
  end

  it 'adds three amounts according to acceptance test' do
    @my_account.deposit(1000)
    expect(@time).to receive(:now).and_return(Time.new(2023, 1, 13))
    @my_account.deposit(2000)
    expect(@time).to receive(:now).and_return(Time.new(2023, 1, 14))
    @my_account.withdraw(500)
    statement = "date || credit || debit || balance\n"\
    "14/01/2023 || || 500.00 || 2500.00\n"\
    "13/01/2023 || 2000.00 || || 3000.00\n"\
    '10/01/2023 || 1000.00 || || 1000.00'
    expect(@my_account.statement).to eq(statement)
  end
end
