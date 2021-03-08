require 'bank'

describe Bank do
  it { is_expected.to respond_to(:add_deposit).with(2).arguments }

  describe '#add_deposit' do
    it 'initializes a deposit class and pushes it into an array' do
      subject.add_deposit(100, "13.01.2020")
      expect(subject.deposits.length).to eq 1
    end

    it "changes the value of balance" do
      subject.add_deposit(100, "13.01.2020")
      expect(subject.balance).to eq 100
    end
  end
end
