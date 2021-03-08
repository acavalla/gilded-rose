require 'withdrawal'

describe Withdrawal do
  describe '#initialize' do
    it 'takes an amount and a date' do
      withdrawal = Withdrawal.new(100, "13.01.2020")
      expect(withdrawal.amount).to eq 100
      expect(withdrawal.date). to eq "13.01.2020"
    end
  end
end
