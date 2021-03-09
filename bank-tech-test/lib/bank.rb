class Bank
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(amount, date)
    adjust_balance(amount)
    new_transaction(amount, date)
  end

  def statement
    str = []
    transactions.reverse_each do |t|
      if t.details["amount"].positive?
        str << deposit(t)
      else
        str << withdrawal(t)
      end
    end
    return str.join("\n")
  end

  def print_statement
    puts "date || credit || debit || balance" +
      (statement.length == 0 ? "" : "\n" + statement)
  end

  private
  attr_writer :balance

  def adjust_balance(amount)
    self.balance += amount
  end

  def new_transaction(amount, date)
    transactions << Transaction.new(amount, date, balance)
  end

  def withdrawal(t)
    "#{t.details["date"]} || || "\
    "#{-t.details["amount"]} || "\
    "#{t.details["current_balance"]}"
  end

  def deposit(t)
    "#{t.details["date"]} || "\
    "#{t.details["amount"]} || || "\
    "#{t.details["current_balance"]}"
  end
end
