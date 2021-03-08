class Bank
  attr_reader :deposits
  def initialize
    @deposits = []
  end

  def deposit(amount)
    @deposits << amount
  end
end
