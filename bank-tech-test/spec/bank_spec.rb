require 'bank'

describe Bank do
  it { is_expected.to respond_to(:deposit).with(1).argument }

  describe '#deposit' do
    it 'saves a deposit'
      subject.deposit(100)
      expect(subject.deposits[0]).to eq 100    
  end
end
