class Bank
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(amount, date)
    new_transaction(amount, date)
    adjust_balance(amount)
  end

  def statement
    str = []
    @transactions.reverse_each do |transaction|
      if transaction.details["amount"] > 0
        str << "#{transaction.details["date"]} || #{transaction.details["amount"]} || || #{@balance}"
      else
        str << "#{transaction.details["date"]} || || #{transaction.details["amount"]} || #{@balance}"
      end
    end
    return str.join("\n")
  end

  def print_statement
    puts "date || credit || debit || balance" + (statement.length == 0 ? "" : "\n" + statement)
  end

  private

  def adjust_balance(amount)
    @balance += amount
  end

  def new_transaction(amount, date)
    @transactions << Transaction.new(amount, date)
  end
end
