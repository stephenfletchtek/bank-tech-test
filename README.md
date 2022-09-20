# Bank tech test

## Requirements

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

A persons money is held in a bank account where they can deposit, withdraw, and check statements amongst other activities.
A 'BankAccount' class can fulfill these requirements.

```ruby
# class name
class BankAccount
end
```

These methods provice the required functionality:

```ruby
# desposit into the bank account
def deposit(amount) # amount is a number
end

# withdraw from the bank account
def withdraw(amount) # amount is a number
end

# print statement  - prints to console in this case
# takes no arguments
def statement
end
```

## Input / Output 

Assumed behaviour is adopted where specification does not give explicit guidance

```ruby
# create bank account view with no transactions
my_account = new BankAccount
my_account.statement => date || credit || debit || balance

# create bank account, add 200 and view statement
my_account = new BankAccount
my_account.deposit(200) => nothing returned but 200 will be credited to account
my_account.statement =>
date || credit || debit || balance
dd/mm/yyyy || 200.00 || || 200.00

# create bank account, add 200, withdraw 50 and view statement
my_account = new BankAccount
my_account.deposit(200) => nothing returned but 200 will be credited to account
my_account.withdraw(50) => nothing returned but 50 will be debited from account
my_account.statement =>
date || credit || debit || balance
dd/mm/yyyy || || 50.00 || 150.00
dd/mm/yyyy || 200.00 || || 200.00

# deposit / withdrawal
my_account = new BankAccount
my_account.deposit("loadsa money") => Error: "deposit method takes one number as an argument"
my_account.withdraw("loadsa money") => Error: "withdraw method takes one number as an argument"

# round deposits / withdrawals to 2 decimal places
my_account = new BankAccount
my_account.deposit(3.1415927) => nothing returned but 3.14 will be credited to account
my_account.statement =>
date || credit || debit || balance
dd/mm/yyyy || 3.14 || || 3.14

# allow account to go overdrawn - no overdraft limit
my_account = new BankAccount
my_account.withdraw(50) => nothing returned but 50 will be debited from account
my_account.statement =>
date || credit || debit || balance
dd/mm/yyyy || || 50.00 || -50.00


# withdraw / deposit blank (no args)
my_account = new BankAccount
my_account.withdraw() => nothing happens
my_account.statement => date || credit || debit || balance

# withdraw / deposit zero
my_account = new BankAccount
my_account.withdraw(0) => nothing happens
my_account.statement => date || credit || debit || balance

# withdraw / deposit calculation in args
my_account = new BankAccount
my_account.deposit(50 + 150) => deposits 200 and returns nothing
my_account.statement =>
date || credit || debit || balance
dd/mm/yyyy || 200.00 || || 200.00

# transaction date
# *** set date to 10/01/2023 ***
my_account.deposit(200) => nothing returned but 200 will be credited to account
my_account.statement =>
date || credit || debit || balance
10/01/2023 || 200.00 || || 200.00

# sort in reverse date order NOT transaction entry order
# *** set date to 10/01/2023 ***
my_account.deposit(200) => nothing returned but 200 will be credited to account
# *** set date to 08/01/2023
my_account.withdraw(50) => nothing returned but 50 will be debited from account
my_account.statement =>
date || credit || debit || balance
10/01/2023 || 200.00 || || 150.00
08/01/2023 || || 50.00 || -50.00
```

## Dependencies

```ruby
gem "rspec", "~> 3.11"
```