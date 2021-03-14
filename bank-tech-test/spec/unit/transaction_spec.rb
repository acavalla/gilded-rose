# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:subject) {described_class.new(100, '13.01.2020', 100)}
  
  describe '#initialize' do
    it 'stores an amount, a date and current balance' do
      expect(subject.amount).to eq 100
      expect(subject.date).to eq '13.01.2020'
      expect(subject.current_balance).to eq 100
    end
  end
end
