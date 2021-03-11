# frozen_string_literal: true

require 'backstage_pass'

describe BackstagePass do
  item = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)

  describe '.update' do
    it 'quality +1 daily and sell-in -1 over 10 days' do
      subject.update(item)
      expect(item.quality).to eq 1
      expect(item.sell_in).to eq 10
    end

    it 'quality +2 daily between 10-5 days' do
      subject.update(item)
      expect(item.quality).to eq 3
    end

    it 'quality +3 between 5-1 days' do
      5.times { subject.update(item) }
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 14
    end

    it 'quality 0 when sell_in is 0' do
      5.times { subject.update(item) }
      expect(item.quality).to eq 0
    end
  end
end
