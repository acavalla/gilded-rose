require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { "11.03.2020" }

  describe '#add_deposit' do
    before :each do
      allow(subject).to receive(:new_deposit).with(amount, date) do subject.deposits << "Deposit" end
    end
    it 'initializes a deposit class and pushes it into an array' do
      subject.add_deposit(amount, date)
      expect(subject.deposits.length).to eq 1
    end

    it "changes the value of balance" do
      subject.add_deposit(amount, date)
      expect(subject.balance).to eq 120
    end

    it "can see the amount deposited" do
      expect(subject).to receive(:adjust_balance).with(amount)
      subject.add_deposit(amount, date)
    end
  end

  describe '#make_withdrawal' do
    before :each do
      allow(subject).to receive(:new_withdrawal).with(amount, date) do subject.withdrawals << "Withdrawal" end

    end
    it 'initializes a withdrawal class and pushes it into an array' do
      subject.make_withdrawal(amount, date)
      expect(subject.withdrawals.length).to eq 1
    end

    it "changes the value of balance" do
      subject.make_withdrawal(amount, date)
      expect(subject.balance).to eq -120
    end

    it "can see the amount deposited" do
      expect(subject).to receive(:adjust_balance).with(-amount)
      subject.make_withdrawal(amount, date)
    end
  end
end
