require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { "11.03.2020" }

  describe '#transaction' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do subject.transactions << "Deposit" end
    end
    
    it 'initializes a deposit class and pushes it into an array' do
      subject.transaction(amount, date)
      expect(subject.transactions.length).to eq 1
    end

    it "changes the value of balance" do
      subject.transaction(amount, date)
      expect(subject.balance).to eq 120
    end

    it "can see the amount deposited" do
      expect(subject).to receive(:adjust_balance).with(amount)
      subject.transaction(amount, date)
    end
  end
end
