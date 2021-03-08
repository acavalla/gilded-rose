require 'bank'

describe Bank do
  it { is_expected.to respond_to(:deposit).with(2).arguments }

  describe '#deposit' do
    it 'initializes a deposit class and pushes it into an array' do
      subject.deposit(100, "13.01.2020")
      expect(subject.deposits.length).to eq 1
    end
  end
end
