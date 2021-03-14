# frozen_string_literal: true

require 'bank'

describe 'features' do
  let(:amount) { 120 }
  let(:date) { '11.03.2020' }
  let(:bank) { Bank.new }
  describe 'sequential transactions' do
    it 'has correct maths' do
      2.times { bank.transaction(amount, date) }
      t1 = bank.transactions[0]
      t2 = bank.transactions[1]
      expect(t2.current_balance).to eq t1.current_balance + amount
    end
  end

  describe 'trio working' do
    it 'is called on initializing' do
      bank.transaction(amount, date)
      expect($stdout).to receive(:puts).with("date || credit || debit || balance\n#{date} || #{amount} || || #{amount}")
      bank.create_statement
    end
  end
end
