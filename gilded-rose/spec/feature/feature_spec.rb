require 'gilded_rose'

describe 'feature' do
  describe 'inheritance working correctly' do
    it 'increases brie by 1' do
      items = [Item.new('foo', 1, 3),
               Item.new('Sulfuras, Hand of Ragnaros', 2, 80),
               Item.new('Aged Brie', 2, 49),
               Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0),
               Item.new('Conjured Hand', 4, 6)]
      gr = GildedRose.new(items)
      gr.update_quality
      expect(items[2].quality).to eq 50
    end
  end

end
