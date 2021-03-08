class Transaction
  attr_reader :details
  def initialize(amount, date)
    @details = {"amount" => amount,
               "date" => date}
  end
end
