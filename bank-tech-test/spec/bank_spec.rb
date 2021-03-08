require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { "11.03.2020" }
  let(:transaction) { { "amount" => amount, "date" => date } }

  describe '#transaction' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do
        subject.transactions << transaction
      end
    end

    it "should call new_transaction and adjust_balance" do
      expect(subject).to receive(:new_transaction).with(amount, date)
      expect(subject).to receive(:adjust_balance).with(amount)
      subject.transaction(amount, date)
    end

    it "stores the amount and date in transactions array" do
      subject.transaction(amount, date)
      expect(subject.transactions[-1]["amount"]).to eq amount
      expect(subject.transactions.length).to eq 1
    end

    it "changes the value of balance" do
      subject.transaction(amount, date)
      expect(subject.balance).to eq amount
    end
  end

  describe '#statement' do
    it 'prints out something' do
      expect(subject).to receive(:puts)
      subject.print_statement
    end

    it 'prints the top level of the table' do
      expect(subject.statement).to eq "date || credit || debit || balance"
    end
  end
end
