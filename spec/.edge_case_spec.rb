# frozen_string_literal: true

require('bank_account')
RSpec.describe BankAccount do
  before(:each) { @my_account = BankAccount.new }

  xit 'shows empty statement' do
    expect(@my_account.statement).to eq('date || credit || debit || balance')
  end

  xit 'wrong number of arguments' do
    expect { @my_account.deposit }
      .to raise_error('wrong number of arguments (given 0, expected 1)')
  end

  xit 'rejects zero deposit' do
    expect { @my_account.deposit(0) }
      .to raise_error('method takes a positive number as an argument')
  end

  xit 'negative withdrawal' do
    expect { @my_account.withdraw(-25) }
      .to raise_error('method takes a positive number as an argument')
  end

  xit 'rejects a string argument' do
    expect { @my_account.deposit('loadsa money') }
      .to raise_error('method takes a positive number as an argument')
  end
end
