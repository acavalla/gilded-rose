# frozen_string_literal: true

require 'bank'

describe 'features' do
  let(:amount) { 120 }
  let(:date) { '11.03.2020' }

  describe 'sequential transactions' do
    it 'has correct maths' do
      bank = Bank.new
      bank.transaction(amount, date)
      bank.transaction(amount, date)
      t1 = bank.transactions[0]
      t2 = bank.transactions[1]
      expect(t2.details['current_balance']).to eq t1.details['current_balance'] + amount
    end

    it 'goes in reverse order' do
      bank = Bank.new
      bank.transaction(amount, date)
      bank.transaction(-amount, date)
      t1 = bank.transactions[0]
      t2 = bank.transactions[1]
      expect(bank.statement).to eq "#{date} || || #{amount} || #{t2.details['current_balance']}\n#{date} || #{amount} || || #{t1.details['current_balance']}"
    end
  end
end
