require('bank_account')

RSpec.describe BankAccount do
  before(:each) do
    @time = double :time
    @my_account = BankAccount.new(0, @time)
  end

  context 'opening balance' do
    it '0 opening balance' do
      expect(BankAccount.new(0, @time).opening_balance).to eq(0)
    end

    it '100 opening balance' do
      expect(BankAccount.new(100, @time).opening_balance).to eq(100)    
    end
  end

  context 'no transactions' do
    it 'has no transactions' do
      expect(@my_account.all_transactions).to eq([])
    end
  end

  context 'single transactions' do
    it 'adds 200 on 20/09/2022' do
      a_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(200)).to eq([a_date, 200])
      expect(@my_account.all_transactions).to eq([[a_date, 200, 200]])
    end

    it 'adds 100 on 20/09/2022' do
      a_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(100)).to eq([a_date, 100])
      expect(@my_account.all_transactions).to eq([[a_date, 100, 100]])
    end

    it 'withdraws 100 on 20/09/2022' do
      a_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(-100)).to eq([a_date, -100])
      expect(@my_account.all_transactions).to eq([[a_date, -100, -100]])
    end

    it 'adds 50 + 150 on 20/09/2022' do
      a_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(50 + 150)).to eq([a_date, 200])
      expect(@my_account.all_transactions).to eq([[a_date, 200, 200]])
    end
  end

  context 'two transactions sorted in ascending date order' do
    it 'adds 200 on 19/09/2022 and 100 on 20/09/2022' do
      a_date = Time.new(2022, 9, 19)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(200)).to eq([a_date, 200])
      b_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(b_date)
      expect(@my_account.transact(100)).to eq([b_date, 100])
      expect(@my_account.all_transactions).to eq([[a_date, 200, 200], [b_date, 100, 300]])
    end

    it 'adds 90 on 19/09/2022 and 100 on 20/09/2022' do
      a_date = Time.new(2022, 9, 19)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(90)).to eq([a_date, 90])
      b_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(b_date)
      expect(@my_account.transact(100)).to eq([b_date, 100])
      expect(@my_account.all_transactions).to eq([[a_date, 90, 90], [b_date, 100, 190]])
    end

    it 'adds 200 on 20/09/2022 and 100 on 19/09/2022' do
      a_date = Time.new(2022, 9, 20)
      expect(@time).to receive(:now).and_return(a_date)
      expect(@my_account.transact(200)).to eq([a_date, 200])
      b_date = Time.new(2022, 9, 19)
      expect(@time).to receive(:now).and_return(b_date)
      expect(@my_account.transact(100)).to eq([b_date, 100])
      expect(@my_account.all_transactions).to eq([[b_date, 100, 100], [a_date, 200, 300]])
    end
  end
end
