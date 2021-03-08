class Bank
  attr_reader :deposits, :balance
  def initialize
    @deposits = []
    @balance = 0
  end

  def add_deposit(amount, date)
    new_deposit(amount, date)
    adjust_balance(amount)
  end

  def adjust_balance(amount)
    @balance += amount
  end

  def new_deposit(amount, date)
    @deposits << Deposit.new(amount, date)
  end
end
