# frozen_string_literal: true

require 'aged_brie'

describe AgedBrie do
  item = Item.new('Aged Brie', 1, 49)
  it 'increases quality and decreases sell_in daily' do
    subject.update(item)
    expect(item.quality).to eq 50
    expect(item.sell_in).to eq 0
  end

  it 'inherits a max of 50 from Inventory' do
    subject.update(item)
    expect(item.quality).to eq 50
  end
end
