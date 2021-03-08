require 'bank'
require 'transaction'

describe "features" do
  let(:amount) { 120 }
  let(:date) { "11.03.2020" }

  describe '#statement' do
    it 'returns one transaction' do
      bank = Bank.new
      bank.transaction(amount, date)
      transaction = bank.transactions[-1]
      expect(bank.statement).to eq "#{date} || #{amount} || || #{transaction.details["current_balance"]}"
    end

    it 'returns multiple transactions with line break' do
      bank = Bank.new
      2.times { bank.transaction(amount, date) }
      transaction1 = bank.transactions[0]
      transaction2 = bank.transactions[1]
      expect(bank.statement).to eq "#{date} || #{amount} || || #{transaction2.details["current_balance"]}\n#{date} || #{amount} || || #{transaction1.details["current_balance"]}"
    end

    it 'can handle withdrawals' do
      bank = Bank.new
      bank.transaction(-amount, date)
      expect(bank.statement).to eq "#{date} || || #{-amount} || #{bank.balance}"
    end

    it 'goes in reverse order' do
      bank = Bank.new
      bank.transaction(amount, date)
      bank.transaction(-amount, date)
      transaction1 = bank.transactions[0]
      transaction2 = bank.transactions[1]
      expect(bank.statement).to eq "#{date} || || #{-amount} || #{transaction2.details["current_balance"]}\n#{date} || #{amount} || || #{transaction1.details["current_balance"]}"
    end
  end

end
