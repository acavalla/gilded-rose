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
    @transactions.reverse_each do |t|
      if t.details["amount"] > 0
        str << "#{t.details["date"]} || #{t.details["amount"]} || || #{t.details["current_balance"]}"
      else
        str << "#{t.details["date"]} || || #{-t.details["amount"]} || #{t.details["current_balance"]}"
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
    @transactions << Transaction.new(amount, date, @balance)
  end
end
