# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'shows empty statement' do
    expect(@my_account.statement).to eq('date || credit || debit || balance')
  end

  it 'wrong number of arguments' do
    expect { @my_account.deposit }
      .to raise_error('wrong number of arguments (given 0, expected 1)')
  end

  it 'rejects zero deposit' do
    expect { @my_account.deposit(0) }
      .to raise_error('deposit method takes one positive number as an argument')
  end

  it 'can go overdrawn' do
    @my_account.withdraw(50)
    statement = "date || credit || debit || balance\n20/09/2022 || || 50.00 || -50.00"
    expect(@my_account.statement).to eq(statement)
  end

  it 'rejects a string argument' do
    expect { @my_account.deposit('loadsa money') }
      .to raise_error('deposit method takes one positive number as an argument')
  end
end
