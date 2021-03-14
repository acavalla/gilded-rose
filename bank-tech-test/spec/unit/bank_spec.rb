# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { '11.03.2020' }
  let(:current_balance) { -120 }
  let(:transaction) { double('transaction') }
  let(:deposit_hash) { { 'amount' => amount, 'date' => date, 'current_balance' => current_balance } }
  let(:withdrawal_hash) { { 'amount' => -amount, 'date' => date, 'current_balance' => current_balance } }

  describe '#transaction' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do
        subject.transactions << transaction
      end
    end

    it 'changes the value of balance' do
      subject.make_transaction(amount, date)
      expect(subject.balance).to eq amount
    end

    it 'can handle withdrawals' do
      allow(subject).to receive(:new_transaction).with(-amount, date) do
        subject.transactions << transaction
      end
      subject.make_transaction(-amount, date)
      allow(transaction).to receive(:details).and_return(withdrawal_hash)
      expect(subject.balance).to eq(-120)
    end
  end
end
