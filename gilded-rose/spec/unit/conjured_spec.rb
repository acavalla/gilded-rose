require 'conjured'

describe Conjured do
  item = Item.new('Conjured Hand', 1, 9)
  it 'reduces quality by 2 and sell_in by 1 daily' do
    subject.update(item)
    expect(item.quality).to eq 7
    expect(item.sell_in).to eq 0
  end

  it 'reduces quality by 4 daily after expiry' do
    subject.update(item)
    expect(item.quality).to eq 3
    expect(item.sell_in).to eq 0
  end
end
