# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:date) { '11.01.2020' }
  let(:date2) { '13.01.2020' }
  let(:transaction) { double('transaction', :amount => balance, :date => date, :current_balance => balance + balance) }
  let(:transaction2) { double('transaction', :amount => -balance, :date => date2, :current_balance => balance) }
  let(:balance) { 120 }

  describe '#calculate' do
    it 'displays statements' do
      expect(subject.calculate([transaction])).to eq "#{transaction.date} || "\
            "#{transaction.amount} || || #{'%.2f' % transaction.current_balance}"
    end

    it 'goes in reverse order' do
      expect(subject.calculate([transaction, transaction2])).to eq "#{date2} || || 120 || "\
      "#{'%.2f' % transaction2.current_balance}\n#{date} || 120 || || "\
      "#{'%.2f' % transaction.current_balance}"
    end
  end
end
