require('bank_account')

RSpec.describe BankAccount do
  context "BankAccount class methods and behaviour" do
    it "creates and shows empty statement" do
      my_account = BankAccount.new
      result = my_account.statement
      statement = "date || credit || debit || balance"
      expect(result).to eq(statement)
    end
  end
end