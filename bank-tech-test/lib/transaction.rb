class Transaction
  attr_reader :details
  def initialize(amount, date)
    @details = {"amount" => amount,
               "date" => date}
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
