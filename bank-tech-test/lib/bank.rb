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
    str = ""
    @transactions.each do |transaction|
      str = str + "#{transaction.details["date"]} || #{transaction.details["amount"]} || || #{@balance}"
    end
    return str
  end

  def print_statement
    puts "date || credit || debit || balance" + statement
  end

  private

  def adjust_balance(amount)
    @balance += amount
  end

  def new_transaction(amount, date)
    @transactions << Transaction.new(amount, date)
  end
end
