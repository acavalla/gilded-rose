require 'inventory'

describe Inventory do
  item = Item.new('foo', 1, 3)
  describe '.update' do
    it 'reduces qual by 1 and sell-in by 1' do
      subject.update(item)
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 2
    end

    it 'reduces qual by 2 when sell-in 0 and stops reducing sell-in' do
      subject.update(item)
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 0
    end
  end
end
