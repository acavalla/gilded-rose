require 'statement'

describe Statement do
  describe '#print' do
    it 'prints out the headers when no recent transactions' do
      expect(subject).to receive(:puts).with('date || credit || debit || balance')
      subject.print
    end
  end
end
