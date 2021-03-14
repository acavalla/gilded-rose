# Bank tech test

This is a mock tech test for week 10 of Maker's Academy. I took a day and a half to build three classes, of which Bank is the dependant, and Transaction and Statement the dependencies. The trade-off benefit of the dependency introduced by the extra classes was to adhere better to the SRP. It made it more complicated as I had to add mocks to inject dependency, but it was a good opportunity to practise my mocking skills.

The rough planning can be seen at the bottom of the readme, and its progress tracked through the commits. I originally planned to have two separate classes for Deposit and Withdrawal, but when I built them out I noticed they were mirroring one another, so to keep things dry I combined them into one and just added a conditional to decide which column (credit/debit) the transaction should go in.

In its current iteration, the date and amount are input manually, and in fact will accept any data, which could be improved. This is an ethical bank which will let you overdraw yourself to an unlimited amount and never charge you any fees, because someone being poor is not a good reason to fine them.

To run this code, please clone the repo; `rspec` will run the test suite.
Please see below for irb demonstration and plans.

**After coach review**
Things to change/add:
- change Rubocop
- **.00**
- Feature/unit test folders
- Test withdrawal printing in statement or feature spec (fixes coverage to 100%)
- Follow user stories in feature spec
- **Autogenerate date / time, use strf, stub**
- "You should be able to indirectly test in your bank_spec that the transactions are being added to the array of transactions (by testing the public methods that are interacting with the private method carrying this out). It looks as though you are doing this manually in your tests."
- Remove commented out code
- Take transaction data out of hash
- "Storing both the balance and the amount is a duplication of code, and you can actually just include the latter in order to calculate the balance after each transaction at runtime of the print statement."
- "In order to fully isolate your classes from one another, dependency injection is something that can employed here: specifically in def create_statement where @statement = Statement.new is being called directly in the method. You could pass in something like statement = Statement.new as a default argument, allowing for the passing in of a double instead of the real class while testing."
- "The same can be done for Transaction.new in your new_transaction method, you could pass in the Transaction class itself in your initialise method as a default argument. This will allow for you to pass in a double instead while testing."

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored in a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit

## Planning

Class: Bank
Methods: transaction [create Transaction class], statement
Instance variables: balance, transactions [array of Transaction class]

Class: Transaction
Keeps track of amounts, date, current balance
Methods: initialize
Instance variables: details hash { amount, date, balance }

## irb
```$ irb -r "./lib/bank"
2.7.2 :001 > bank = Bank.new
 => #<Bank:0x00007fc65b9c25d8 @balance=0, @transactions=[]>
2.7.2 :002 > bank.transaction(100, "01.01.2000")
 => [#<Transaction:0x00007fc65b8e4ad0 @details={"amount"=>100, "date"=>"01.01.2000", "current_balance"=>100}>]
2.7.2 :003 > bank.transaction(1000, "03.01.2000")
 => [#<Transaction:0x00007fc65b8e4ad0 @details={"amount"=>100, "date"=>"01.01.2000", "current_balance"=>100}>, #<Transaction:0x00007fc65b9903f8 @details={"amount"=>1000, "date"=>"03.01.200
0", "current_balance"=>1100}>]
2.7.2 :004 > bank.transaction(-675, "04.01.2000")
 => [#<Transaction:0x00007fc65b8e4ad0 @details={"amount"=>100, "date"=>"01.01.2000", "current_balance"=>100}>, #<Transaction:0x00007fc65b9903f8 @details={"amount"=>1000, "date"=>"03.01.200
0", "current_balance"=>1100}>, #<Transaction:0x00007fc65b999408 @details={"amount"=>-675, "date"=>"04.01.2000", "current_balance"=>425}>]
2.7.2 :005 > bank.create_statement
date || credit || debit || balance
04.01.2000 || || 675 || 425
03.01.2000 || 1000 || || 1100
01.01.2000 || 100 || || 100```

To do:
- Remove Transaction amount, date, balance from unnecessary hash
- See if there's a more efficient way to return all those values from a double in spec
