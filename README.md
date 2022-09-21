# Bank tech test

## Requirements

There requirements were provided in the exercise

* You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

``` 
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Design overview

I have chosen to code this tech-test in ruby.

A persons money is held in a bank account where they can deposit, withdraw, and view statements.

* Bank class will be used to coordinate all activities 
* BankAccount class handles transactions
* Statement class will handles statement viewing

This basic strucure gives:

Model |BankAccount
Controller | Bank
View |Statement

External interaction is via the controller

### Bank class

```ruby
# class name
class Bank
  def initialize
    BankAccount.new
    Statement.new
  end
end
```

These methods provide the required functionality:

```ruby
# returns statement in a format that can be printed
# takes no arguments
def show_statement
end

# desposit into the bank account
def deposit(amount) # amount is a number
end

# withdraw from the bank account
def withdraw(amount) # amount is a number
end
```

### BankAccount class

```ruby
class BankAccount
end
```

These methods interact with Bank class

```ruby
def transact(amount)
  # move money in or out of the bank account
end

def all_transactions
  # return all account transactions
end
```

### Statement class

```ruby
class Statement
end
```

This method interacts with Bank class

```ruby
def create_statement(bank_account)
  # return statement information for a given BankAccount in a printable format
end
```

## Input / Output 

Assumed behaviour is adopted where specification does not give explicit guidance

```ruby
# create bank account view with no transactions
my_bank = Bank.new
my_bank.show_statement => date || credit || debit || balance

# create bank account, add 200 and view statement
my_bank = Bank.new
my_bank.deposit(200) => 200 will be credited to account
my_bank.show_statement =>
date || credit || debit || balance
dd/mm/yyyy || 200.00 || || 200.00

# create bank account, add 200, withdraw 50 and view statement
my_bank = Bank.new
my_bank.deposit(200) => 200 will be credited to account
my_bank.withdraw(50) => 50 will be debited from account
my_bank.show_statement =>
date || credit || debit || balance
dd/mm/yyyy || || 50.00 || 150.00
dd/mm/yyyy || 200.00 || || 200.00

# deposit / withdrawal
my_bank = Bank.new
my_bank.deposit("loadsa money") => Error: 'method takes a positive number as an argument'
my_bank.withdraw("loadsa money") => Error: 'method takes a positive number as an argument'

# round deposits / withdrawals to 2 decimal places
my_bank = Bank.new
my_bank.deposit(3.1415927) => 3.1415927 will be credited to account
my_bank.show_statement =>
date || credit || debit || balance
dd/mm/yyyy || 3.14 || || 3.14

# allow account to go overdrawn - no overdraft limit
my_bank = Bank.new
my_bank.withdraw(50) => 50 will be debited from account
my_bank.show_statement =>
date || credit || debit || balance
dd/mm/yyyy || || 50.00 || -50.00

# withdraw / deposit blank (no args)
my_bank = Bank.new
my_bank.withdraw => 'Error: wrong number of arguments (given 0, expected 1)'

# withdraw / deposit zero
my_bank = Bank.new
my_bank.withdraw(0) => => Error: 'method takes a positive number as an argument'

# withdraw / deposit calculation in args
my_bank = Bank.new
my_bank.deposit(50 + 150) => deposits 200
my_bank.show_statement =>
date || credit || debit || balance
dd/mm/yyyy || 200.00 || || 200.00

# transaction date
my_bank = Bank.new(BankAccount.new(0, mock_time))
expect(mock_time).to receive(:now).and_return(Time.new(2023, 1, 10))
my_bank.deposit(200) => 200 will be credited to account
my_bank.show_statement =>
date || credit || debit || balance
10/01/2023 || 200.00 || || 200.00

# sort in reverse date order NOT transaction entry order
my_bank = Bank.new(BankAccount.new(0, mock_time))
expect(mock_time).to receive(:now).and_return(Time.new(2023, 1, 10))
my_account.deposit(200) => 200 will be credited to account
expect(mock_time).to receive(:now).and_return(Time.new(2023, 1, 8))
my_account.withdraw(50) => 50 will be debited from account
my_account.show_statement =>
date || credit || debit || balance
10/01/2023 || 200.00 || || 150.00
08/01/2023 || || 50.00 || -50.00
```

## Example use

This example shows how to use the methods, and their responses when interacting with the Bank class using irb:

```irb
3.0.0 :001 > require('./lib/bank')
 => true 
3.0.0 :002 > my_bank = Bank.new
 => #<Bank:0x00007fa97a146600 @bank_account=#<BankAccount:0x00007fa97a1465b0 @time=Time, @opening_balance=0, @transactions=[]>, @statement=#<Statement:0x00007fa97a146330>> 
3.0.0 :003 > my_bank.deposit(1000)
 => [2022-09-21 15:36:13.728527 +0100, 1000] 
3.0.0 :004 > my_bank.deposit(2000)
 => [2022-09-21 15:36:30.184626 +0100, 2000] 
3.0.0 :005 > my_bank.withdraw(500)
 => [2022-09-21 15:36:35.673944 +0100, -500] 
3.0.0 :006 > print(my_bank.show_statement)
date || credit || debit || balance
21/09/2022 || || 500.00 || 2500.00
21/09/2022 || 2000.00 || || 3000.00
21/09/2022 || 1000.00 || || 1000.00 => nil
```

## Dependencies

```ruby
gem "rspec", "~> 3.11"
```