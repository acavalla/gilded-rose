require 'bank'

describe Bank do
  let(:deposit_amount) { 120 }
  let(:deposit_date) { "11.03.2020" }

  describe '#add_deposit' do

    before :each do
      allow(subject).to receive(:new_deposit).with(deposit_amount, deposit_date) do subject.deposits << "Deposit" end
    end
    it 'initializes a deposit class and pushes it into an array' do
      subject.add_deposit(deposit_amount, deposit_date)
      expect(subject.deposits.length).to eq 1
    end

    it "changes the value of balance" do
      subject.add_deposit(deposit_amount, deposit_date)
      expect(subject.balance).to eq 120
    end

    it "can see the amount deposited" do
      expect(subject).to receive(:adjust_balance).with(deposit_amount)
      subject.add_deposit(deposit_amount, deposit_date)
    end
  end
end
