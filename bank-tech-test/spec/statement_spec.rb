# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:date) { '11.01.2020' }
  let(:date2) { '13.01.2020' }
  let(:transaction) { double('transaction') }
  let(:transaction2) { double('transaction') }
  let(:balance) { 120 }
  let(:transaction_hash) { { 'amount' => 120, 'date' => date, 'current_balance' => balance } }
  let(:transaction_hash2) { { 'amount' => 120, 'date' => date2, 'current_balance' => balance } }
  let(:subject) { Statement.new([transaction]) }

  describe '#calculate' do
    before do
      allow(transaction).to receive(:details).and_return(transaction_hash)
      allow(transaction2).to receive(:details).and_return(transaction_hash2)
    end

    it 'displays statements' do
      expect(subject.calculate).to eq "#{date} || 120 || || #{balance}"
    end

    it 'goes in reverse order' do
      statement = Statement.new([transaction, transaction2])
      expect(statement.calculate).to eq "#{date2} || 120 || || "\
      "#{transaction.details['current_balance']}\n#{date} || 120 || || "\
      "#{transaction2.details['current_balance']}"
    end
  end
end
