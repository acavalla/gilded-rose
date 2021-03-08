class Bank
  attr_reader :deposits, :balance
  def initialize
    @deposits = []
    @balance = 0
  end

  def add_deposit(amount, date)
    @deposits << Deposit.new(amount, date)
    @balance += amount
  end
end
