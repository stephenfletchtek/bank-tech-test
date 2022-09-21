require('statement')

RSpec.describe Statement do
  before(:each) do
    @my_account = double :bank_account
    # expect(@my_account).to receive(:opening_balance).and_return(0)
  end

  context 'no transactions' do
    it 'shows statement header' do
      expect(@my_account).to receive(:all_transactions).and_return([])
      result = Statement.new.create_statement(@my_account)
      expect(result).to eq('date || credit || debit || balance')      
    end
  end

  context 'single credit' do
    it 'shows statement with single credit of 200' do
      expect(@my_account).to receive(:all_transactions).and_return([[Time.new(2022, 9, 20), 200, 200]])
      result = Statement.new.create_statement(@my_account)
      statement = "date || credit || debit || balance\n20/09/2022 || 200.00 || || 200.00"
      expect(result).to eq(statement)
    end

    it 'shows statement with single credit of 100' do
      expect(@my_account).to receive(:all_transactions).and_return([[Time.new(2022, 9, 20), 100, 100]])
      result = Statement.new.create_statement(@my_account)
      statement = "date || credit || debit || balance\n20/09/2022 || 100.00 || || 100.00"
      expect(result).to eq(statement)
    end

    it 'shows statement with single credit of 3.1415927' do
      expect(@my_account).to receive(:all_transactions).and_return([[Time.new(2022, 9, 20), 3.1415927, 3.1415927]])
      result = Statement.new.create_statement(@my_account)
      statement = "date || credit || debit || balance\n20/09/2022 || 3.14 || || 3.14"
      expect(result).to eq(statement)
    end
  end

  context 'withdrawal' do
    it 'shows statement with single withdrawal of 50' do
      expect(@my_account).to receive(:all_transactions).and_return([[Time.new(2022, 9, 20), -50, -50]])
      result = Statement.new.create_statement(@my_account)
      statement = "date || credit || debit || balance\n20/09/2022 || || 50.00 || -50.00"
      expect(result).to eq(statement)
    end
  end

  context 'two transactions' do
    it 'shows statement with 200 added and 50 withdrawn' do
      expect(@my_account).to receive(:all_transactions)
        .and_return([[Time.new(2022, 9, 20), 200, 200], [Time.new(2022, 9, 20), -50, 150]])
      result = Statement.new.create_statement(@my_account)
      statement = "date || credit || debit || balance\n"\
      "20/09/2022 || || 50.00 || 150.00\n"\
      '20/09/2022 || 200.00 || || 200.00'
      expect(result).to eq(statement)
    end
  end
end
