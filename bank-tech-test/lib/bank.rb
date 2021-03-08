class Bank
  attr_reader :balance, :deposits, :withdrawals
  def initialize
    @balance = 0
    @deposits = []
    @withdrawals = []
  end

  def add_deposit(amount, date)
    new_deposit(amount, date)
    adjust_balance(amount)
  end

  def make_withdrawal(amount, date)
    new_withdrawal(amount, date)
    adjust_balance(-amount)
  end

  def adjust_balance(amount)
    @balance += amount
  end

  def new_deposit(amount, date)
    @deposits << Deposit.new(amount, date)
  end

  def new_withdrawal(amount, date)
    @withdrawals << Withdrawal.new(amount, date)
  end
end
