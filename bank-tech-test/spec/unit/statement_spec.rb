# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:date) { '11.01.2020' }
  let(:date2) { '13.01.2020' }
  let(:transaction) { double('transaction') }
  let(:transaction2) { double('transaction') }
  let(:balance) { 120 }

  describe '#calculate' do
    before do
      allow(transaction).to receive(:amount).and_return(balance)
      allow(transaction2).to receive(:amount).and_return(-balance)
      allow(transaction).to receive(:date).and_return(date)
      allow(transaction2).to receive(:date).and_return(date2)
      allow(transaction).to receive(:current_balance).and_return(balance)
      allow(transaction2).to receive(:current_balance).and_return(balance)
    end

    it 'displays statements' do
      expect(subject.calculate([transaction])).to eq "#{date} || 120 || || #{balance}"
    end

    it 'goes in reverse order' do
      expect(subject.calculate([transaction, transaction2])).to eq "#{date2} || || 120 || "\
      "#{transaction.current_balance}\n#{date} || 120 || || "\
      "#{transaction2.current_balance}"
    end
  end
end
