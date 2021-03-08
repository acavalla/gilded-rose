require 'deposit'

describe Deposit do
  describe '#initialize' do
    it 'takes an amount and a date' do
      deposit = Deposit.new(100, "13.01.2020")
      expect(deposit.amount).to eq 100
      expect(deposit.date). to eq "13.01.2020"
    end
  end
end
