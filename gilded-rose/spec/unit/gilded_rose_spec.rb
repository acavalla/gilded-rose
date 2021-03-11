# frozen_string_literal: true

# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
  item = Item.new('Sulfuras, Hand of Ragnaros', 2, 80)
  gilded_rose = GildedRose.new([item])

  describe '#update_quality' do
    before :all do
      gilded_rose.update_quality
    end

    context 'Sulfura' do
      it 'keeps quality of sulfura at 80' do
        expect(item.quality).to eq 80
      end
    end
  end
end
