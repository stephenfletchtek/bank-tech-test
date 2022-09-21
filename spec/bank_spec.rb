require('bank')

RSpec.describe Bank do
  before(:each) do
    @my_account = double :bank_account
    @my_statement = double :statement
    @my_bank = Bank.new(@my_account, @my_statement)
  end

  context 'statement' do
    it 'Bank shows statement with single credit of 200' do
      statement = "date || credit || debit || balance\n20/09/2022 || 200.00 || || 200.00"
      expect(@my_statement).to receive(:create_statement).with(@my_account).and_return(statement)
      expect(@my_bank.show_statement).to eq(statement)
    end
  end

  context 'deposit' do
    it 'Deposit 200 into bank' do
      time = Time.new(2022, 9, 20)
      expect(@my_account).to receive(:transact).with(200).and_return([time, 200])
      expect(@my_bank.deposit(200)).to eq([time, 200])
    end

    it 'wrong number of arguments' do
      expect { @my_bank.deposit }
        .to raise_error('wrong number of arguments (given 0, expected 1)')
    end
  
    it 'rejects zero deposit' do
      expect { @my_bank.deposit(0) }
        .to raise_error('method takes a positive number as an argument')
    end
  
    it 'negative deposit' do
      expect { @my_bank.deposit(-25) }
        .to raise_error('method takes a positive number as an argument')
    end
  
    it 'rejects a string argument' do
      expect { @my_bank.deposit('loadsa money') }
        .to raise_error('method takes a positive number as an argument')
    end
  end

  context 'withdrawal' do
    it 'Withdraw 200 from bank' do
      time = Time.new(2022, 9, 20)
      expect(@my_account).to receive(:transact).with(-200).and_return([time, -200])
      expect(@my_bank.withdraw(200)).to eq([time, -200])
    end
  end
end
