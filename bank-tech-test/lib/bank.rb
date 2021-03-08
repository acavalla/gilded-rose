class Bank
  attr_reader :deposits
  def initialize
    @deposits = []
  end

  def deposit(amount, date)
    @deposits << Deposit.new(amount, date)
  end
end
