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

A persons money is held in a bank account where they can deposit, withdraw, and check statements amongst other activities.
A 'BankAccount' class can fulfill these requirements.

```ruby
# class name
class BankAccount
end
```

These methods provice the functionality specified:

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



## Dependencies

```ruby
gem "rspec", "~> 3.11"
```