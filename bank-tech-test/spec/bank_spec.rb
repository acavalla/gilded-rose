require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { "11.03.2020" }
  let(:transaction) { { "amount" => amount, "date" => date } }

  describe '#transaction' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do subject.transactions << transaction end
    end

    it "stores the amount and date in transactions array" do
      subject.transaction(amount, date)
      expect(subject.transactions[-1]["amount"]).to eq amount
      expect(subject.transactions.length).to eq 1
      # puts subject
      #
      # puts subject.transactions[0]
    end

    it "changes the value of balance" do
      subject.transaction(amount, date)
      expect(subject.balance).to eq amount
    end
  end
end
