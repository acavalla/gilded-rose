# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#initialize' do
    it 'takes an amount, a date and current balance' do
      transaction = Transaction.new(100, '13.01.2020', 100)
      expect(transaction.amount).to eq 100
      expect(transaction.date).to eq '13.01.2020'
      expect(transaction.current_balance).to eq 100
    end
  end
end
