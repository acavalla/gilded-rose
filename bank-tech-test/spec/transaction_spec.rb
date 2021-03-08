require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'takes an amount and a date' do
      transaction = Transaction.new(100, "13.01.2020")
      expect(transaction.details["amount"]).to eq 100
      expect(transaction.details["date"]). to eq "13.01.2020"
    end
  end

  # describe '#self.all' do
  #   it 'class method to return itself' do
  #     transaction = Transaction.new(100, "13.01.2020")
  #     transactions = Transaction.all
  #     transactions.each do |transaction|
  #       puts transaction.details
  #     end
  #     expect(transactions[-1].details).to eq transaction.details
  #   end
  # end
end
