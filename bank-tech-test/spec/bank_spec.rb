# frozen_string_literal: true

require 'bank'

describe Bank do
  let(:amount) { 120 }
  let(:date) { '11.03.2020' }
  let(:current_balance) { -120 }
  let(:transaction) { double('transaction') }
  let(:deposit_hash) { { 'amount' => amount, 'date' => date, 'current_balance' => current_balance } }
  let(:withdrawal_hash) { { 'amount' => -amount, 'date' => date, 'current_balance' => current_balance } }

  describe '#transaction_deposit' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do
        subject.transactions << transaction
      end
    end

    it 'should call new_transaction and adjust_balance' do
      expect(subject).to receive(:new_transaction).with(amount, date)
      expect(subject).to receive(:adjust_balance).with(amount)
      subject.transaction(amount, date)
    end

    it 'stores the amount and date in transactions array' do
      subject.transaction(amount, date)
      allow(transaction).to receive(:details).and_return(deposit_hash)
      expect(subject.transactions[-1].details['amount']).to eq amount
      expect(subject.transactions[-1].details['date']).to eq date
      expect(subject.transactions.length).to eq 1
    end

    it 'changes the value of balance' do
      subject.transaction(amount, date)
      expect(subject.balance).to eq amount
    end
  end

  describe '#transaction_deposit' do
    it 'can handle withdrawals' do
      allow(subject).to receive(:new_transaction).with(-amount, date) do
        subject.transactions << transaction
      end
      subject.transaction(-amount, date)
      allow(transaction).to receive(:details).and_return(withdrawal_hash)
      expect(subject.statement).to eq "#{date} || || #{amount} || #{subject.balance}"
    end
  end

  # describe '#print_statement' do
  #   it 'prints out something' do
  #     expect(subject).to receive(:puts).with('date || credit || debit || balance')
  #     subject.print_statement
  #   end
  # end

  describe '#statement' do
    before :each do
      allow(subject).to receive(:new_transaction).with(amount, date) do
        subject.transactions << transaction
      end
      allow(transaction).to receive(:details).and_return(deposit_hash)
    end

    it 'returns one transaction' do
      subject.transaction(amount, date)
      expect(subject.statement).to eq "#{date} || #{amount} || || #{transaction.details['current_balance']}"
    end

    it 'returns multiple transactions with line break' do
      2.times { subject.transaction(amount, date) }
      expect(subject.statement).to eq "#{date} || #{amount} || || #{transaction.details['current_balance']}\n#{date} || #{amount} || || #{transaction.details['current_balance']}"
    end
  end
end
