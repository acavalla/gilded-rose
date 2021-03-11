# frozen_string_literal: true

# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
  items = [Item.new('foo', 1, 3),
           Item.new('Sulfuras, Hand of Ragnaros', 2, 80),
           Item.new('Aged Brie', 2, 49),
           Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0),
           Item.new('Conjured Hand', 4, 6)]
  gilded_rose = GildedRose.new(items)

  describe '#update_quality' do
    before :all do
      gilded_rose.update_quality
    end

    context 'Sulfura' do
      it 'keeps quality of sulfura at 80' do
        expect(items[1].quality).to eq 80
      end
    end
  end
end
