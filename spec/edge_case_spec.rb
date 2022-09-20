# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  it 'shows empty statement' do
    expect(@my_account.statement).to eq('date || credit || debit || balance')
  end

  it 'wrong number of arguments' do
    expect { @my_account.deposit }
      .to raise_error('wrong number of arguments (given 0, expected 1..2)')
  end

  it 'rejects zero deposit' do
    expect { @my_account.deposit(0) }
      .to raise_error('deposit method takes one positive number as an argument')
  end

  it 'negative withdrawal' do
    expect { @my_account.withdraw(-25) }
      .to raise_error('withdraw method takes one positive number as an argument')
  end

  it 'rejects a string argument' do
    expect { @my_account.deposit('loadsa money') }
      .to raise_error('deposit method takes one positive number as an argument')
  end
end
