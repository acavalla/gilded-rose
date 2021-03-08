require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:negative_amount) { -120 }
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

  describe '#print_statement' do
    before :each do
      # allow(subject).to receive(:new_transaction).with(amount, date) do
      #   subject.transactions << transaction
      # end
    end

    it 'prints out something' do
      expect(subject).to receive(:puts).with("date || credit || debit || balance")
      subject.print_statement
    end
  end

  describe '#statement' do
    it 'returns one transaction' do
      subject.transaction(amount, date)
      expect(subject.statement).to eq "#{date} || #{amount} || || #{subject.balance}"
    end

    it 'returns multiple transactions with line break' do
      2.times { subject.transaction(amount, date) }
      expect(subject.statement).to eq "#{date} || #{amount} || || #{subject.balance}\n#{date} || #{amount} || || #{subject.balance}"
    end

    it 'can handle withdrawals' do
      subject.transaction(negative_amount, date)
      expect(subject.statement).to eq "#{date} || || #{negative_amount} || #{subject.balance}"
    end
  end
end
